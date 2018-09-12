CREATE TABLE
IF NOT EXISTS availabilities
(
  id SERIAL PRIMARY KEY,
  space_id INT,
  date VARCHAR(10)
);
