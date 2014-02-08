require 'spec_helper'

describe Recipe do

  it "is valid with name" do
    recipe = Recipe.new(name: 'bábovka')
    expect(recipe).to be_valid
  end

  it "is invalid without name" do
    expect(Recipe.new(name: nil)).to have(1).errors_on(:name)
  end

  describe "filter recipe's name by letter" do
    before :each do 
      @cukrovi = Recipe.create(name: "Cukroví", description: "Toto je recept na cukroví")
      @babovka = Recipe.create(name: "Bábovka", description: "Toto je recept na bábovku")
      @bublanina = Recipe.create(name: "Bublanina", description: "Toto je recept na bublaninu") 
    end       
      
    context "matching letters"  do
      it "shows recipes ordered by name" do
        expect(Recipe.by_letter("B")).to eq [@babovka, @bublanina]
      end
    end

    context "non-matching letters" do
      it "shows recipes ordered by name" do
        expect(Recipe.by_letter("B")).to_not include @cukrovi
      end
    end
  end
end
