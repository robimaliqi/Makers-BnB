require 'pg'

class Spaces
  attr_reader :name, :id, :available

  def initialize(name:, id:, available:)
    @name = name
    @id = id
    @available = available
  end 

  def self.book(id:)
    connection = PG.connect(dbname: 'makersbnb_test')
    spaces = connection.exec_params("UPDATE spaces SET available=FALSE WHERE id=$1 RETURNING id, name, available;",[id])
  end

  def self.all
    connection = PG.connect(dbname: 'makersbnb_test')
    spaces = connection.exec_params("SELECT * FROM spaces WHERE available='t';")
    spaces.map do |space|
      Spaces.new(name: space['name'], id: space['id'], available: space['available'])
    end
  end
end