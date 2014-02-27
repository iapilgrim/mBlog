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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :step do
    order 1
    description "MyText"
  end
end
