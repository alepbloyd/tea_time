FactoryBot.define do
  factory :customer_subscription do
    customer_id {}
    subscription_id {}
    status { [true,false].sample }
  end
end