FactoryBot.define do
  factory :customer_tea do
    customer_id {}
    tea_id {}
    title { Faker::Subscription.plan }
    price { Faker::Number.decimal(l_digits: 2) }
    frequency { [30,60,90].sample }
    status { [true,false].sample }
  end
end