CREATE TABLE IF NOT EXISTS bookings (
  id SERIAL PRIMARY KEY,
  space_id INT,
  date INT,
  renter_id INT
);
