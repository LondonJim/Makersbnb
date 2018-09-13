require 'bcrypt'

class User < ActiveRecord::Base
  has_many :spaces
  has_many :messages
  has_many :bookings

  validates :handle, uniqueness: true
  validates :email, uniqueness: true

  def self.login(handle:, password:)
    validates :handle, presence: true
    validates :password, presence: true
    BCrypt::Password.new(User.find_by(handle: handle).password) == password
  end

  def self.sign_up(name:, handle:, email:, password:, password_confirmation:)
    return nil if password != password_confirmation
    encrypted_pword = BCrypt::Password.create(password)
    User.create(
      name: name,
      handle: handle,
      email: email,
      password: encrypted_pword
    )
  end
end
