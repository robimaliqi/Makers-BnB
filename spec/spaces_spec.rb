require 'spaces'

RSpec.describe Spaces do
  describe "the .create method" do
    it "creates new instance of space" do
      space_1 = Spaces.create("Space_1")
      spaces = Spaces.all
      expect(spaces).to include(space_1)
    end
  end
end     