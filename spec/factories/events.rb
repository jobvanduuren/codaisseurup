
FactoryGirl.define do
  factory :event do

    name              { Faker::Pokemon.name }
    description       { Faker::Lorem.sentence }
    location          { Faker::Lorem.sentence }
    price             { Faker::Commerce.price }
    capacity          { Faker::Number.number(4)}
    includes_food      true
    includes_drinks    true
    starts_at         { Faker::Date.forward}
    ends_at           { Faker::Date.forward}
    active             true
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
