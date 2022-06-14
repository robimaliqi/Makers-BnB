require 'spaces'

RSpec.describe Spaces do
  describe ".all method" do
    it "returns all spaces" do
      # space_1 = Spaces.create("Space_1")
      # space_2 = Spaces.create("Space_2")
      # space_3 = Spaces.create("Space_3")

      spaces = Spaces.all

      expect(spaces.first.name).to eq ("Space_1")
      expect(spaces.last.name).to eq ("Space_3")
    end
  end
end     