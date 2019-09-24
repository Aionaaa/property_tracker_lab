DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker (
  id SERIAL8 PRIMARY KEY,
  address VARCHAR(255),
  no_of_bedrooms INT2,
  year_built INT2,
  buy_or_let VARCHAR(255)
);
