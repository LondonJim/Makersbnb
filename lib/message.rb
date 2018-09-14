class Message < ActiveRecord::Base
  belongs_to :user

  def self.new_message(user_id:, space_id:, dates:, status:)
    dates.split(',').each do |date| 
      self.create(
        user_id: user_id,
        space_id: space_id,
        dates: date,
        status: status
      )
    end
  end
end
