# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient_in_recipe do
    recipe nil
    ingredient nil
    amount 1
    unit "MyString"
  end
end
