require 'bcrypt'

class User < ActiveRecord::Base
  has_many :spaces
  has_many :messages
  has_many :bookings

  def self.signup(name:, handle:, email:, password:)
    return if (User.find_by(handle: handle))
    return if (User.find_by(email: email))
    User.create(name: name, handle: handle, email: email, password: password)
  end
end
