require 'faker'
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    name { Faker::Name.name }
    # paragraphs have to be joined, otherwise Faker will return hash (no plain string)
    description { Faker::Lorem.paragraphs(5).join('\n') } 

    # this code will add three ingredients to recipe
    # after(:build) do |recipe|
    #   ["sugar", "flour", "butter"].each do |ingredient|
    #     recipe.ingredients << FactoryGirl.build(:ingredient, name: ingredient)
    #   end
    # end

    factory :invalid_recipe do
      name nil
    end
  end
end
