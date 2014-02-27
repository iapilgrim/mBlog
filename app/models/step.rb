# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  order       :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  recipe_id   :integer
#

class Step < ActiveRecord::Base
  has_many :ingredient_in_steps
  has_many :ingredients, :through => :ingredient_in_steps
  belongs_to :recipe
end
