DROP TABLE spending_tracker;

CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  category VARCHAR(255),
  merchant_id INT8 REFERENCES merchant(id)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  merchants_id INT8 REFERENCES merchant(id),
  tags_id INT8 REFERENCES tag(id),
  price NUMERIC
);
