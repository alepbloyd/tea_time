FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    description { Faker::Coffee.notes }
    temperature { Faker::Number.within(range: 140..212)}
    brew_time { Faker::Number(digits: 3)}
    created_at { Faker::Time.backward(days:365) }
    updated_at { Faker::Time.backward(days:365) }
  end
end