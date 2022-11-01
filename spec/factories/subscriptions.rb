FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.decimal(l_digits: 2) }
    frequency { [30,60,90].sample }
  end
end
