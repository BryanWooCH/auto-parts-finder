
require "bcrypt"

def run_sql(sql)
  conn = PG.connect(ENV['DATABASE_URL']|| {dbname: "autopartsdb"}) 
  records = conn.exec(sql)
  conn.close
  return records
end



def all_users()
  
  return run_sql("SELECT * FROM users;")
end

def find_one_user(id)

  return nil unless id  
  return run_sql("select * from users where id = #{id};").first
end

def create_user(username, email, delivery_address, users_car, users_car_year, users_car_id, password)

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


