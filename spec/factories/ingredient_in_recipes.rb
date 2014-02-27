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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient_in_recipe do
    recipe nil
    ingredient nil
    amount 1
    unit "MyString"
  end
end
