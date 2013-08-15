class IngredientInStep < ActiveRecord::Base
  belongs_to :step
  belongs_to :ingredient
  attr_accessible :amount, :unit
end
