require 'pg'

def test_database_setup

  connection = PG.connect(dbname: 'makersbnb_test')

  connection.exec("DROP TABLE users;")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), handle VARCHAR(60), email VARCHAR(60), password VARCHAR(60));")

  connection.exec("DROP TABLE spaces;")
  connection.exec("CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR(60), owner_id INT, information VARCHAR(140), location VARCHAR(60), price INT NOT NULL);")

  connection.exec("DROP TABLE messages;")
  connection.exec("CREATE TABLE messages(id SERIAL PRIMARY KEY, renter_id INT, owner_id INT, space_id INT, dates INT);")

  connection.exec("DROP TABLE bookings;")
  connection.exec("CREATE TABLE bookings(id SERIAL PRIMARY KEY, space_id INT, date INT, renter_id INT);")

  connection.exec("DROP TABLE availability;")
  connection.exec("CREATE TABLE availability(id SERIAL PRIMARY KEY, space_id INT, date INT);")
end
