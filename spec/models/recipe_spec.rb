require 'spec_helper'

describe Recipe do

    it "is valid with name" do
      recipe = Recipe.new(name: 'bábovka')
      expect(recipe).to be_valid
    end

    it "is invalid without name" do
      expect(Recipe.new(name: nil)).to have(1).errors_on(:name)
    end
end
