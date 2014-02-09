require 'spec_helper'

describe Recipe do

  it "is valid with name" do
    expect(build(:recipe)).to be_valid
  end

  it "is invalid without name" do
    expect(build(:recipe, name: nil)).to have(1).errors_on(:name)
  end

# testing associations

  # it "may contain many ingredients" do 
  #  recipe = create(:recipe)
  #  recipe.ingredients << create(:ingredient, name: "sugar") 
  #  expect(recipe.ingredients.find_by_name("sugar")).to eq true
  # end

  # it "may contain many ingredients" do
  #   expect { create(:recipe).ingredients }.to_not raise_error
  # end

  # using 'shoulda' gem
  it { should have_many(:ingredients).through(:ingredient_in_recipes) }  

  describe "filter recipe's name by letter" do
    before :each do 
      @sweets = create(:recipe, name: "Sweets")
      @cake = create(:recipe, name: "Cake")
      @carrot_cake = create(:recipe, name: "Carrot cake")
    end       
      
    context "matching letters"  do
      it "shows recipes ordered by name" do
        expect(Recipe.by_letter("C")).to eq [@cake, @carrot_cake]
      end
    end

    context "non-matching letters" do
      it "shows recipes ordered by name" do
        expect(Recipe.by_letter("C")).to_not include @sweets
      end
    end
  end
end
