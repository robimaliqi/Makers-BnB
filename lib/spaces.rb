require 'pg'
require_relative 'database_connection'

class Spaces
  attr_reader :id, :name, :description, :available

  def initialize( id:, name:, description:, available:)
    @name = name
    @id = id
    @description = description
    @available = available
  end 

  def self.create(name:, description:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description) VALUES($1, $2) RETURNING id, name, description, available;",
     [name, description]
    )
      Spaces.new(
        id: result[0]['id'],
        name: result[0]['name'],
        description: result[0]['description'],
        available: result[0]['available']
      )
  end

  def self.book(id:)
    spaces = DatabaseConnection.query(
      "UPDATE spaces SET available=FALSE WHERE id=$1 
      RETURNING id, name, description, available;",
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
        available: space['available']
      )
    end
  end
end