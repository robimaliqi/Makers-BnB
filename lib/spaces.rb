require 'pg'
require_relative 'database_connection'

class Spaces
  attr_reader :id, :name, :description, :price, :available

  def initialize(id:, name:, description:, price:, available:)
    @name = name
    @id = id
    @description = description
    @price = price
    @available = available
  end

  def self.create(name:, description:, price:)
    result = DatabaseConnection.query(
      'INSERT INTO spaces (name, description, price) VALUES($1, $2, $3) RETURNING id, name, description, price, available;',
      [name, description, price.to_f]
    )
    Spaces.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      available: result[0]['available']
    )
  end

  def self.book(id:)
    spaces = DatabaseConnection.query(
      "UPDATE spaces SET available=FALSE WHERE id=$1
      RETURNING id, name, description, price, available;",
      [id]
    )
  end

  def self.all
    spaces = DatabaseConnection.query("SELECT * FROM spaces WHERE available='t';")
    spaces.map do |space|
      Spaces.new(
        id: space['id'],
        name: space['name'],
        description: space['description'],
        price: space['price'],
        available: space['available']
      )
    end
  end
end