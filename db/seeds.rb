# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customers = []
subscriptions = []

10.times do
  customers << FactoryBot.create(:customer)
end

20.times do
  subscriptions << FactoryBot.create(:subscription)
end

customers.each do |c|
  subs = subscriptions.shuffle[0..2]

  subs.each do |s|
    CustomerSubscription.create(customer_id: c.id, subscription_id: s.id, status: [0,1].sample)
  end
end