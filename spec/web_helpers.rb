def add_three_spaces
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO spaces VALUES(1, 'spacename1', 'Kar-ho', 'Great house', '123 Fake Street', 100);")
  connection.exec("INSERT INTO spaces VALUES(2, 'spacename2', 'James', 'Average house', '234 Fake Street', 50);")
  connection.exec("INSERT INTO spaces VALUES(3, 'spacename3', 'Harry', 'Terrible house', '345 Fake Street', '25);")
end
