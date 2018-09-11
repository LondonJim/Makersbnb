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
    @location = loaction
    @price = price
  end

  def self.all
    connection = env_check
    spaces = connection.exec("SELECT * FROM spaces")
    spaces.map do |space|
      Space.new(
        id: space['id'],
        name: space['name'],
        owner_id: space['owner_id'],
        information: space['information'],
        location: space['loaction'],
        price: space['price']
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
