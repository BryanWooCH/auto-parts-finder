CREATE DATABASE autopartsdb;

CREATE TABLE cars (
  id SERIAL PRIMARY KEY,
  make TEXT,
  model TEXT,
  fromyear TEXT,
  toyear TEXT,
  variant TEXT
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT UNIQUE,
  email TEXT UNIQUE,
  delivery_address TEXT,
  users_car TEXT,
  users_car_year TEXT,
  users_car_id INTEGER,
  password_digest TEXT
);

CREATE TABLE parts (
  id SERIAL PRIMARY KEY,
  car_id INTEGER,
  brake_pad_front TEXT,
  brake_pad_rear TEXT,
  oil_filter TEXT,
  air_filter TEXT
);

CREATE TABLE partsinfo (
  id SERIAL PRIMARY KEY,
  parts_number TEXT,
  parts_name TEXT,
  description TEXT,
  manufacturer TEXT,
  retail_price TEXT,
  cost_price TEXT,
  parts_image_url TEXT
);





ALTER TABLE cars ADD COLUMN brake_pad_front TEXT, brake_pad_rear TEXT, oil_filter TEXT, air_filter TEXT;





INSERT INTO users (email, bio) VALUES ('dt@ga.co', 'mistyrose');


INSERT INTO cars (make, model, fromyear, toyear, variant) VALUES ('mazda', 'mazda 3', '2014', '2019', 'BM');
INSERT INTO cars (make, model, fromyear, toyear, variant) VALUES ('mazda', 'mazda 3', '2009', '2013', 'BL');
INSERT INTO cars (make, model, fromyear, toyear, variant) VALUES ('mazda', 'cx-3', '2015', 'on', 'dk');
INSERT INTO cars (make, model, fromyear, toyear, variant) VALUES ('mazda', 'cx-5', '2012', '2017', 'ke');
INSERT INTO cars (make, model, fromyear, toyear, variant) VALUES ('mazda', 'cx-9', '2007', '2016', 'tb');
INSERT INTO cars (make, model, fromyear, toyear, variant) VALUES ('mazda', 'cx-9', '2017', 'on', 'tc');


INSERT INTO parts (car_id, brake_pad_front, brake_pad_rear, oil_filter, air_filter) VALUES ('6', 'DB1916', 'DB1917', 'Z436', 'A1934');

UPDATE cars SET brake_pad_front = 'DB1916' WHERE id = 6;
UPDATE cars SET brake_pad_rear = 'DB1917' WHERE id = 6;
UPDATE cars SET oil_filter = 'Z436' WHERE id = 6;
UPDATE cars SET air_filter = 'A1934' WHERE id = 6;

INSERT INTO parts (car_id, brake_pad_front, brake_pad_rear, oil_filter, air_filter) VALUES ('2', 'DB1679', 'DB1763', 'Z632', 'A1523');

UPDATE cars SET brake_pad_front = 'DB1679' WHERE id = 2;
UPDATE cars SET brake_pad_rear = 'DB1763' WHERE id = 2;
UPDATE cars SET oil_filter = 'Z632' WHERE id = 2;
UPDATE cars SET air_filter = 'A1523' WHERE id = 2;


INSERT INTO parts (car_id, brake_pad_front, brake_pad_rear, oil_filter, air_filter) VALUES ('1', 'DB2330', 'DB2331', 'Z436', 'A1785');

UPDATE cars SET brake_pad_front = 'DB2330' WHERE id = 1;
UPDATE cars SET brake_pad_rear = 'DB2331' WHERE id = 1;
UPDATE cars SET oil_filter = 'Z436' WHERE id = 1;
UPDATE cars SET air_filter = 'A1785' WHERE id = 1;



INSERT INTO parts (car_id, brake_pad_front, brake_pad_rear, oil_filter, air_filter) VALUES ('3', 'DB2330', 'DB2227', 'Z436', 'A1887');

UPDATE cars SET brake_pad_front = 'DB2330' WHERE id = 3;
UPDATE cars SET brake_pad_rear = 'DB2227' WHERE id = 3;
UPDATE cars SET oil_filter = 'Z436' WHERE id = 3;
UPDATE cars SET air_filter = 'A1887' WHERE id = 3;

INSERT INTO parts (car_id, brake_pad_front, brake_pad_rear, oil_filter, air_filter) VALUES ('4', 'DB2226', 'DB2227', 'Z436', 'A1785');

UPDATE cars SET brake_pad_front = 'DB2226' WHERE id = 4;
UPDATE cars SET brake_pad_rear = 'DB2227' WHERE id = 4;
UPDATE cars SET oil_filter = 'Z436' WHERE id = 4;
UPDATE cars SET air_filter = 'A1785' WHERE id = 4;

INSERT INTO parts (car_id, brake_pad_front, brake_pad_rear, oil_filter, air_filter) VALUES ('5', 'DB1916', 'DB1917', 'Z596', 'A1623');

UPDATE cars SET brake_pad_front = 'DB1916' WHERE id = 5;
UPDATE cars SET brake_pad_rear = 'DB1917' WHERE id = 5;
UPDATE cars SET oil_filter = 'Z596' WHERE id = 5;
UPDATE cars SET air_filter = 'A1623' WHERE id = 5;



UPDATE parts SET oil_filter = 'Z436' WHERE id = 1;

UPDATE cars SET make = 'Mazda' WHERE make = 'mazda';
UPDATE cars SET model = 'Mazda 3' WHERE model = 'mazda 3';
UPDATE cars SET model = 'CX-3' WHERE model = 'cx-3';
UPDATE cars SET model = 'CX-5' WHERE model = 'cx-5';
UPDATE cars SET model = 'CX-9' WHERE model = 'cx-9';
UPDATE cars SET model = 'CX-3' WHERE model = 'cx-3';
UPDATE cars SET model = 'CX-5' WHERE model = 'cx-5';
UPDATE cars SET variant = 'DK' WHERE variant = 'dk';
UPDATE cars SET variant = 'KE' WHERE variant = 'ke';
UPDATE cars SET variant = 'TB' WHERE variant = 'tb';
UPDATE cars SET variant = 'TC' WHERE variant = 'tc';

UPDATE users SET variant = 'TC' WHERE variant = 'tc';


INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('DB1916', 'Front Brake Pad', 'Bendix', '55.64');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('DB1679', 'Front Brake Pad', 'Bendix', '40.80');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('DB2330', 'Front Brake Pad', 'Bendix', '59.19');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('DB2226', 'Front Brake Pad', 'Bendix', '89.35');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('DB1917', 'Rear Brake Pad', 'Bendix', '51.93');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('DB1763', 'Rear Brake Pad', 'Bendix', '40.80');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('DB2331', 'Rear Brake Pad', 'Bendix', '59.19');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('DB2227', 'Rear Brake Pad', 'Bendix', '76.69');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('DB1917', 'Rear Brake Pad', 'Bendix', '70.14');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('Z436', 'Oil Filter', 'Ryco', '16');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('Z632', 'Oil Filter', 'Ryco', '17');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('Z596', 'Oil Filter', 'Ryco', '43');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('A1934', 'Air Filter', 'Ryco', '35');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('A1523', 'Air Filter', 'Ryco', '35');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('A1785', 'Air Filter', 'Ryco', '26');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('A1887', 'Air Filter', 'Ryco', '42');
INSERT INTO partsinfo (parts_number, parts_name, manufacturer, retail_price) VALUES ('A1623', 'Air Filter', 'Ryco', '40');

INSERT INTO dishes (name, image_url) VALUES ('cake', 'https://images.immediate.co.uk/production/volatile/sites/2/2019/04/Choc-Fudge-Cake-b2d1909.jpg?quality=45&resize=620,413');

INSERT INTO dishes (name, image_url) VALUES ('cakepudding', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZLXi-CKb2ElX7Z7yZohS-WHbNuCsQuDhKX6DQiEDfrBLla5yD&s');


https://bendix.imgix.net/part_drawings/DB1917.jpg
https://ryco.blob.core.windows.net/ryco/Files/img/product_lg/z436.jpg

https://ryco.blob.core.windows.net/ryco/Files/img/product_lg/z436.jpg