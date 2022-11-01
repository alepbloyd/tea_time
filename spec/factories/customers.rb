FactoryBot.define do
  factory :customer do
    f_name = Faker::Name.first_name
    l_name = Faker::Name.last_name
    first_name { f_name }
    last_name { l_name }
    email { "#{f_name}.#{l_name}@fakeemail.fake" }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state_ab { Faker::Address.state_abbr}
  end
end