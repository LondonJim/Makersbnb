require 'bcrypt'

class User < ActiveRecord::Base
  has_many :spaces
  has_many :messages
  has_many :bookings

  validates :handle, uniqueness: true
  validates :email, uniqueness: true

end
