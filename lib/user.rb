require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :name, :handle, :email, :password
  def initialize(id:, name:, handle:, email:, password:)
    @id = id
    @name = name
    @handle = handle
    @email = email
    @password = password
  end

  def self.sign_up(name:, handle:, email:, password:)
    encrypted_pword = BCrypt::Password.create(password)
    result = env_check.exec("
      INSERT INTO users (name, handle, email, password)
      VALUES('#{name}', '#{handle}', '#{email}', '#{encrypted_pword}')
      RETURNING id, name, handle, email, password;
      ")
    user_create(result)
  end

  def self.all
    users = env_check.exec("SELECT * FROM users;")
    users.map do |user|
      User.new(
        id: user['id'],
        name: user['name'],
        handle: user['handle'],
        email: user['email'],
        password: user['password']
      )
    end
  end

  def self.password_check(handle, password)
    result = env_check.exec("SELECT * FROM users WHERE HANDLE = '#{handle}';")
    BCrypt::Password.new(user_create(result).password) == password
  end

  private

  def self.env_check
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
  end

  def self.user_create(result)
    user = User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      handle: result[0]['handle'],
      email: result[0]['email'],
      password: result[0]['password']
    )
    user
  end
end

