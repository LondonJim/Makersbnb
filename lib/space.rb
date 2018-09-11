class Space < ActiveRecord::Base
  has_many :availabilities
  belongs_to :user
end
