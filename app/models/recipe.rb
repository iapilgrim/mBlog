class Recipe < ActiveRecord::Base
  attr_accessible :description, 
                  :name, 
                  :ingredient_in_recipes_attributes

  has_many :ingredient_in_recipes, :dependent => :destroy
  has_many :ingredients, 
            :through => :ingredient_in_recipes

  
  has_many :steps, :dependent => :destroy

  accepts_nested_attributes_for :ingredient_in_recipes, 
            :reject_if => :all_blank,
            :allow_destroy => :true
  accepts_nested_attributes_for :ingredients
end
