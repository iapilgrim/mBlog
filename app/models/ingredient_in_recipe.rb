# == Schema Information
#
# Table name: ingredient_in_recipes
#
#  id            :integer          not null, primary key
#  recipe_id     :integer
#  ingredient_id :integer
#  amount        :integer
#  unit          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class IngredientInRecipe < ActiveRecord::Base
                  
  belongs_to :recipe
  belongs_to :ingredient
  
  accepts_nested_attributes_for :ingredient
end
