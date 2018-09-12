require 'bcrypt'

class User < ActiveRecord::Base
  has_many :spaces
  has_many :messages
  has_many :bookings

  validates :handle, uniqueness: true
  validates :email, uniqueness: true

  def self.login(handle:, password:)
    return false unless User.find_by(handle: handle)
    user = User.find_by(handle: handle)
    (user.password == password)
  end
end
