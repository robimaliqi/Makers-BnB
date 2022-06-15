require 'spaces'

RSpec.describe Spaces do
  describe ".all method" do
    it "returns all spaces" do
      space_1 = Spaces.create(name: "Space_1")
      space_2 = Spaces.create(name: "Space_2")
      space_3 = Spaces.create(name: "Space_3")

      spaces = Spaces.all

      expect(spaces.first.name).to eq ("Space_1")
      expect(spaces.last.name).to eq ("Space_3")
    end
  end

  describe ".book method" do
    it "changes the space to no longer be available" do
      space_1 = Spaces.create(name: "Space_1")
      space_2 = Spaces.create(name: "Space_2")
      space_3 = Spaces.create(name: "Space_3")

      Spaces.book(id: space_1.id)
      spaces = Spaces.all

      expect(spaces.first.name).to eq ("Space_2")
    end
  end

  describe ".create method" do
    it "creates a new instance of a space" do
      space_1 = Spaces.create(name: "Space_1")

      spaces = Spaces.all

      expect(spaces.first.name).to eq ("Space_1")
    end
  end
end     