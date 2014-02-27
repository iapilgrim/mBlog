# == Schema Information
#
# Table name: ingredient_in_steps
#
#  id            :integer          not null, primary key
#  step_id       :integer
#  ingredient_id :integer
#  amount        :integer
#  unit          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class IngredientInStep < ActiveRecord::Base
  belongs_to :step
  belongs_to :ingredient
end
