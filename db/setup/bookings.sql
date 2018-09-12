CREATE TABLE
IF NOT EXISTS bookings
(
  id SERIAL PRIMARY KEY,
  user_id INT,
  space_id INT,
  date INT
);
