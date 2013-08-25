class IngredientInRecipe < ActiveRecord::Base
  attr_accessible :amount, 
                  :unit,
                  :ingredient,
                  :ingredient_attributes
                  
  belongs_to :recipe
  belongs_to :ingredient, :dependent => :destroy
  

  accepts_nested_attributes_for :ingredient
end
