class Ingredient < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :ingredient_in_recipes, :dependent => :destroy
  has_many :ingredient_in_steps, :dependent => :destroy
  has_many :recipes, :through => :ingredient_in_recipes
  has_many :steps, :through => :ingredient_in_steps
end
