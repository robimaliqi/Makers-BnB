require 'pg'

class Spaces
  attr_reader :id, :name, :available

  def initialize( id:, name:, available:)
    @name = name
    @id = id
    @available = available
  end 

  def self.create(name:)
    connection = PG.connect(dbname: 'makersbnb_test')
    result = connection.exec_params(
      "INSERT INTO spaces (name) VALUES($1) RETURNING id, name, available;",
     [name]
    )
      Spaces.new(
        id: result[0]['id'],
        name: result[0]['name'],
        available: result[0]['available']
      )
  end

  def self.book(id:)
    connection = PG.connect(dbname: 'makersbnb_test')
    spaces = connection.exec_params(
      "UPDATE spaces SET available=FALSE WHERE id=$1 
      RETURNING id, name, available;",
      [id]
    )
  end

  def self.all
    connection = PG.connect(dbname: 'makersbnb_test')
    spaces = connection.exec_params("SELECT * FROM spaces WHERE available='t';")
    spaces.map do |space|
      Spaces.new(
        id: space['id'],
        name: space['name'],
        available: space['available']
      )
    end
  end
end