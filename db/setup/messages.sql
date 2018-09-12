CREATE TABLE
IF NOT EXISTS messages
(
  id SERIAL PRIMARY KEY,
  user_id INT,
  space_id INT,
  dates INT,
  status BOOLEAN
);
