def add_three_spaces
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec("INSERT INTO spaces VALUES(1, 'spacename1', 'Kar-ho', 'Great house', '£100');")
  connection.exec("INSERT INTO spaces VALUES(1, 'spacename2', 'James', 'Average house', '£50');")
  connection.exec("INSERT INTO spaces VALUES(1, 'spacename3', 'Harry', 'Terrible house', '£25');")
end
