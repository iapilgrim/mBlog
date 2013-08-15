# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient_in_step do
    step nil
    ingredient nil
    amount 1
    unit "MyString"
  end
end
