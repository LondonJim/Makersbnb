CREATE TABLE IF NOT EXISTS spaces (
  id INTEGER PRIMARY KEY,
  name VARCHAR(60),
  owner_id INT,
  information VARCHAR(140),
  location VARCHAR (60),
  price INT
);
