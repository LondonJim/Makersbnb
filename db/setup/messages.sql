CREATE TABLE IF NOT EXISTS messages (
  id SERIAL PRIMARY KEY,
  renter_id INT,
  owner_id INT,
  space_id INT,
  dates INT
);
