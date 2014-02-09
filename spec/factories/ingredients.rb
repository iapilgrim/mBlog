require 'faker'
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs(2).join('\n') } 
  end
end
