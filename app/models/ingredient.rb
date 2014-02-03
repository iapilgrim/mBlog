class Ingredient < ActiveRecord::Base
  
  has_many :ingredient_in_recipes
  has_many :recipes, :through => :ingredient_in_recipes

  has_many :steps, :through => :ingredient_in_steps
  has_many :ingredient_in_steps, :dependent => :destroy
end
