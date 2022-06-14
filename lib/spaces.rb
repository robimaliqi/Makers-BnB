require 'pg'

class Spaces
  attr_reader :name

  def initialize(name)
    @name = name
    
  end 

  def self.all
    connection = PG.connect(dbname: 'makersbnb_test')
    spaces = connection.exec_params("SELECT * FROM spaces;")
    spaces.map do |space|
      Spaces.new( space['name'] )
    end
  end
end