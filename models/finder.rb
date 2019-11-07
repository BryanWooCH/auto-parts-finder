
# DRY - dont repeat yourself

# re-directing

def run_sql(sql)
  #connect
  # conn = PG.connect(dbname: "goodfoodhunting") 
  # db is in my laptop for development.


  conn = PG.connect(ENV['DATABASE_URL']|| {dbname: "autopartsdb"})  # for production and deploy 

  records = conn.exec(sql)
  #close
  conn.close
  return records
end



def all_cars()
  return run_sql("SELECT * FROM cars;")
end

# def all_parts()
#   return run_sql("SELECT * FROM parts;")
# end

def all_partsinfo()
  return run_sql("SELECT * FROM partsinfo;")
end

def create_dish(name, image_url)
  return run_sql("INSERT INTO dishes (name, image_url) VALUES('#{name}', '#{image_url}');")
end

def destroy_dish(id)
  return run_sql("delete from dishes Where id = #{id};")
end



def find_one_model(model, year)
  return run_sql("select * from cars where model = '#{model}'and fromyear <= '#{year}' and toyear >= '#{year}';").first
end

# def find_parts_by_model(id)
#   return run_sql("select * from parts where car_id = #{id};").first
# end

def find_parts_info_detail(parts_number)
  return run_sql("select * from partsinfo where parts_number = '#{parts_number}';").first
end

def find_parts_by_number(parts_number)
  return run_sql("select * from cars where brake_pad_front = '#{parts_number}' or brake_pad_rear = '#{parts_number}' or oil_filter = '#{parts_number}' or air_filter = '#{parts_number}';").to_a
end

# def find_car_by_id(id)
#   return run_sql("select * from cars where id = #{id};").first
# end


def find_one_car(id)
  return run_sql("select * from cars where id = #{id};").first
end

def update_car(id, make, model, fromyear, toyear, variant, brake_pad_front, brake_pad_rear, oil_filter, air_filter)
  update_sql = "UPDATE cars SET make = '#{make}'"
  update_sql += ", model = '#{model}'"
  update_sql += ", fromyear = '#{fromyear}'"
  update_sql += ", toyear = '#{toyear}'"
  update_sql += ", variant = '#{variant}'"
  update_sql += ", brake_pad_front = '#{brake_pad_front}'"
  update_sql += ", brake_pad_rear = '#{brake_pad_rear}'"
  update_sql += ", oil_filter = '#{oil_filter}'"
  update_sql += ", air_filter = '#{air_filter}'"
  update_sql += " WHERE id = #{id};"
  return run_sql(update_sql)
end

def delete_car(id)
  return run_sql("delete from cars Where id = #{id};")
end

def create_car(make, model, fromyear, toyear, variant, brake_pad_front, brake_pad_rear, oil_filter, air_filter)
  return run_sql("INSERT INTO cars (make, model, fromyear, toyear, variant, brake_pad_front, brake_pad_rear, oil_filter, air_filter) VALUES('#{make}','#{model}','#{fromyear}', '#{toyear}', '#{variant}', '#{brake_pad_front}', '#{brake_pad_rear}', '#{oil_filter}', '#{air_filter}');")
end