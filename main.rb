     
require 'sinatra'
enable :sessions
if settings.development?
  require 'sinatra/reloader'  
  # also_reload ('models/*')
  also_reload File.expand_path(__dir__, 'models/*') if development?
  require 'pry'
end

require 'pg'
require_relative 'models/finder.rb'  #'models/dish' 
require_relative 'models/users.rb'

def logged_in
  return !!current_user
  # if session[:user_id]
  #   return true
  # else
  #   return false
  # end
end

def current_user
  find_one_user(session[:user_id])
end

get '/' do
  erb :index
end

get '/search_by_keywords' do
  @model = params["model"]
  @year = params["year"]
  @found_model= find_one_model(@model, @year)

  if @found_model == nil
    redirect "/"
  else
    # @found_parts= find_parts_by_model(@found_model['id'])
    # @front= find_parts_by_number(@found_model['brake_pad_front'])

    @front_brake_img = "https://bendix.imgix.net/part_drawings/#{@found_model['brake_pad_front']}.jpg"
    @rear_brake_img = "https://bendix.imgix.net/part_drawings/#{@found_model['brake_pad_rear']}.jpg"
    @oil_filter_img = "https://ryco.blob.core.windows.net/ryco/Files/img/product_lg/#{@found_model['oil_filter'].downcase}.jpg"

    if @found_model['air_filter'].include? 'A1934'
      @air_filter_img = "https://ryco.blob.core.windows.net/ryco/Files/img/product_lg/#{@found_model['air_filter']}.jpg"
    else
      @air_filter_img = "https://ryco.blob.core.windows.net/ryco/Files/img/product_lg/#{@found_model['air_filter'].downcase}.jpg"
    end

    @ebay_search = 'https://www.ebay.com.au/sch/i.html?_nkw='
    @best_match = '&_sop=12'
    @lowest_price = '&_sop=15'
    erb :result_by_model
  end
end

get '/search_by_parts_number' do
  @parts_number = params["parts_number"]
  @parts_detail = find_parts_info_detail(@parts_number)
  if @parts_detail == nil
    redirect "/"
  else
    @found_parts = find_parts_by_number(@parts_number)  
    if @parts_number.include? 'DB'
      @parts_img_url = "https://bendix.imgix.net/part_drawings/#{@parts_number}.jpg"
    elsif @parts_number.include? 'A1934'
      @parts_img_url = "https://ryco.blob.core.windows.net/ryco/Files/img/product_lg/#{@parts_number}.jpg"
    else
      @parts_img_url = "https://ryco.blob.core.windows.net/ryco/Files/img/product_lg/#{@parts_number.downcase}.jpg"
    end

    @ebay_search = 'https://www.ebay.com.au/sch/i.html?_nkw='
    @best_match = '&_sop=12'
    @lowest_price = '&_sop=15'
    erb :result_by_parts
  end
end

get '/admin' do
  @user = params[:id]
  erb :admin
end

get '/db' do
  @user = params[:id]
  @cars = all_cars()
  # @parts = all_parts()
  @partsinfo = all_partsinfo()
  erb :db
end

get '/car_edit' do
  @car = find_one_car(params[:id])
  erb :edit_cars
end

patch '/car_update' do
  update_car(params[:id], params[:make], params[:model], params[:fromyear], params[:toyear], params[:variant], params[:brake_pad_front], params[:brake_pad_rear], params[:oil_filter], params[:air_filter])
  redirect :"/db?id=13"
end

delete '/car_delete' do
  delete_car(params[:id])
  redirect "/db?id=13"
end

get '/car_new' do
  erb :new_car
end

post '/car_create' do
  create_car(params[:make], params[:model], params[:fromyear], params[:toyear], params[:variant], params[:brake_pad_front], params[:brake_pad_rear], params[:oil_filter], params[:air_filter])
  redirect "/db?id=13"
end

get '/members' do
  @user = params[:id]
  @users = all_users()
  erb :members
end

get '/user_details' do
  @user = find_one_user(params[:id])
  erb :memberdetails
end

# delete '/delete_user' do
delete '/user_delete' do
  delete_users(params[:id])
  session[:user_id] = nil
  redirect "/"
end

get '/user_edit' do
  @user = find_one_user(params[:id])
  erb :edit_user
end

patch '/user_update' do
  found_car_detail = find_one_model(params[:users_car], params[:users_car_year])
  if found_car_detail == nil
    car_id = 9999
  else
    car_id = found_car_detail["id"]
  end
  update_users(params[:id], params[:username], params[:email], params[:delivery_address], params[:users_car], params[:users_car_year], car_id, params[:password])
  redirect :"/user_details?id=#{params[:id]}"
end

get '/user_new' do
  erb :new_user
end

post '/user_create' do
  found_car_detail = find_one_model(params[:users_car], params[:users_car_year])
  if found_car_detail == nil
    car_id = 9999
  else
    car_id = found_car_detail["id"]
  end
  create_user(params[:username], params[:email], params[:delivery_address], params[:users_car], params[:users_car_year], car_id, params[:password])
  redirect "/"
end



get '/login' do
  erb :login
end

post '/login' do
  # check bryan's account exist in the db
  user = find_user_by_email(params[:email])
  if user == nil
    return "who??"
  elsif BCrypt::Password.new( user["password_digest"] ) == params[:password]
    session[:user_id] = user["id"] # single source of truth!!
    redirect "/"  #its up to you prob user's dashboard profile page!
  else
    return "who??"
  end
  redirect "/"
end

delete '/logout' do
  session[:user_id] = nil
  redirect "/"
end

