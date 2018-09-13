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
end
