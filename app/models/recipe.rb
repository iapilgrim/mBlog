class Recipe < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :ingredient_in_recipes, :dependent => :destroy
  has_many :ingredients, through => :ingredient_in_recipes
  has_many :steps, :dependent => :destroy
end
