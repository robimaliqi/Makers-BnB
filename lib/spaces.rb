require 'pg'
require_relative 'database_connection'

class Spaces
  attr_reader :id, :name, :description, :price, :available, :available_from, :available_to

  def initialize( id:, name:, description:, price:, available:, available_from:, available_to:)
    @name = name
    @id = id
    @description = description
    @price = price
    @available = available
    @available_from = available_from
    @available_to = available_to
  end 

  def self.create(name:, description:, price:, available_from:, available_to:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description, price, available_from, available_to) VALUES($1, $2, $3, $4, $5) RETURNING id, name, description, price, available, available_from, available_to;",
      [name, description, price.to_f, available_from, available_to]
    )
      Spaces.new(
        id: result[0]['id'],
        name: result[0]['name'],
        description: result[0]['description'],
        price: result[0]['price'],
        available: result[0]['available'],
        available_from: result[0]['available_from'],
        available_to: result[0]['available_to'],
      )
  end

  def self.book(id:)
    spaces = DatabaseConnection.query(
      "UPDATE spaces SET available=FALSE WHERE id=$1 
      RETURNING id, name, description, price, available, available_from, available_to; ",
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
        available: space['available'],
        available_from: Date.parse(space["available_from"]).strftime('%d/%m/%Y'),
        available_to: Date.parse(space["available_to"]).strftime('%d/%m/%Y'),
      )
    end
  end
end