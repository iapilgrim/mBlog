# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ActiveRecord::Base

  validates :name, presence: true

  has_many :ingredient_in_recipes, :dependent => :destroy
  has_many :ingredients, 
           :through => :ingredient_in_recipes

  has_many :steps, :dependent => :destroy

  accepts_nested_attributes_for :ingredient_in_recipes, 
            :reject_if => :all_blank,
            :allow_destroy => :true
  accepts_nested_attributes_for :ingredients

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end  

end
