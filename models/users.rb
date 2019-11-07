
require "bcrypt"

def run_sql(sql)
  conn = PG.connect(ENV['DATABASE_URL']|| {dbname: "autopartsdb"})  # for production and 
  # binding.pry
  records = conn.exec(sql)
  conn.close
  return records
end



def all_users()
  # conn = PG.connect(dbname: "goodfoodhunting")
  # sql = "SELECT * FROM dishes;"
  # dishes = conn.exec(sql)
  # conn.close
  # return dishes

  return run_sql("SELECT * FROM users;")
end

def find_one_user(id)
  # conn = PG.connect(dbname: "goodfoodhunting")
  # sql = "select * from dishes where id = #{id};"
  # dish = conn.exec(sql).first # very bold conn.exec return array
  # conn.close
  # return dish

  return nil unless id  #guard condition - early return
  return run_sql("select * from users where id = #{id};").first
end

def create_user(username, email, delivery_address, users_car, users_car_year, users_car_id, password)
  # conn = PG.connect(dbname: "goodfoodhunting")
  # sql = "INSERT INTO dishes (name, image_url) VALUES('#{name}', '#{image_url}');"
  # conn.exec(sql)
  # conn.close

  password_digest = BCrypt::Password.create(password)
  return run_sql("INSERT INTO users (username, email, delivery_address, users_car, users_car_year, users_car_id, password_digest) VALUES('#{username}','#{email}','#{delivery_address}', '#{users_car}', '#{users_car_year}', #{users_car_id}, '#{password_digest}');")
end


def delete_users(id)
  return run_sql("delete from users Where id = #{id};")
end


def update_users(id, username, email, delivery_address, users_car, users_car_year, users_car_id, password)

  password_digest = BCrypt::Password.create(password)

  update_sql = "UPDATE users SET username = '#{username}'"
  update_sql += ", email = '#{email}'"
  update_sql += ", delivery_address = '#{delivery_address}'"
  update_sql += ", users_car = '#{users_car}'"
  update_sql += ", users_car_year = '#{users_car_year}'"
  update_sql += ", users_car_id = #{users_car_id}"
  update_sql += ", password_digest = '#{password_digest}'"
  update_sql += " WHERE id = #{id};"
  return run_sql(update_sql)
end

def find_user_by_email(email)
  return run_sql("select * from users where email = '#{email}';").first
end


