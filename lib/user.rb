class User < ActiveRecord::Base
  has_many :spaces
  has_many :messages
  has_many :bookings
end
