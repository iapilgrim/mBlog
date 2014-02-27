# == Schema Information
#
# Table name: ingredients
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Ingredient < ActiveRecord::Base
  
  has_many :ingredient_in_recipes
  has_many :recipes, :through => :ingredient_in_recipes

  has_many :steps, :through => :ingredient_in_steps
  has_many :ingredient_in_steps, :dependent => :destroy
end
