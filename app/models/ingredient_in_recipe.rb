class IngredientInRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  attr_accessible :amount, :unit
end
