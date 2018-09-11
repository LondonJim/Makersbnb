def add_one_space
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO spaces VALUES(1, 'spacename1', 1, 'Great house', '123 Fake Street', 100);")
end

def add_three_spaces
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO spaces VALUES(1, 'spacename1', 1, 'Great house', '123 Fake Street', 100);")
  connection.exec("INSERT INTO spaces VALUES(2, 'spacename2', 2, 'Average house', '234 Fake Street', 50);")
  connection.exec("INSERT INTO spaces VALUES(3, 'spacename3', 3, 'Terrible house', '345 Fake Street', 25);")
end

def add_availability_for_three_spaces
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO availability VALUES(1, 1, 100918);")
  connection.exec("INSERT INTO availability VALUES(2, 1, 110918);")
  connection.exec("INSERT INTO availability VALUES(3, 2, 100918);")
  connection.exec("INSERT INTO availability VALUES(4, 2, 110918);")
  connection.exec("INSERT INTO availability VALUES(5, 3, 100918);")
  connection.exec("INSERT INTO availability VALUES(6, 3, 110918);")
end

def sign_up_user
  User.sign_up(name: 'XX', handle: 'XX', email: 'XX', password: 'XX')
end
