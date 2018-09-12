CREATE TABLE
IF NOT EXISTS users
(
  id SERIAL PRIMARY KEY,
  name VARCHAR
(60),
  handle VARCHAR
(60),
  email VARCHAR
(60),
  password VARCHAR
(60)
);
