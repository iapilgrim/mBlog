class Step < ActiveRecord::Base
#  attr_accessible :description, :order
  has_many :ingredient_in_steps
  has_many :ingredients, :through => :ingredient_in_steps
  belongs_to :recipe
end
