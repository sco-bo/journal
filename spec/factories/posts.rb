require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.body { Faker::Lorem.paragraph }
    f.private { Faker::Boolean.boolean }
    user
  end
end