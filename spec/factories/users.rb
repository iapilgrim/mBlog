# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Michal"
    sequence(:email) { |n| "michalhorcic#{n}@example.com"}
  end
end
