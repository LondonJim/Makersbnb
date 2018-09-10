require 'pg'

class Space
  attr_reader :id, :name, :owner_id, :information, :location, :price
  def initialize(
                id:,
                name:, 
                owner_id:, 
                information:,
                location:,
                price:
                )
    @id = id
    @name = name
    @owner_id = owner_id
    @information = information
    @location = location
    @price = price
  end

  def self.all
    connection = self.env_check
    spaces = connection.exec("SELECT * FROM spaces")
    spaces.map do |space|
      Space.new(
        id: space['id'].to_i,
        name: space['name'],
        owner_id: space['owner_id'].to_i,
        information: space['information'],
        location: space['location'],
        price: space['price'].to_i
      )
    end
  end

  private

  def self.env_check
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
  end
end



