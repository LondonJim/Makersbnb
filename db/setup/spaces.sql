CREATE TABLE
IF NOT EXISTS spaces
(
  id SERIAL PRIMARY KEY,
  name VARCHAR
(60),
  info VARCHAR
(140),
  location VARCHAR
(60),
  user_id INT,
  price INT
);
