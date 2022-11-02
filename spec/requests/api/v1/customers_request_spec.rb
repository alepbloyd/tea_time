require 'rails_helper'

describe 'Customers API' do

  it 'can create a new customer' do

    customer_params = {
      first_name: "Jimmy",
      last_name: "Snakes",
      email: "Jimmy_Snakes@email.net",
      street_address: "123 Python St",
      city: "Reno",
      state_ab: "NV"
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/customers/", headers: headers, params: JSON.generate(customer: customer_params)

    expect(response).to be_successful

    created_customer = Customer.last

    expect(created_customer.first_name).to eq("Jimmy")
    expect(created_customer.last_name).to eq("Snakes")
    expect(created_customer.email).to eq("Jimmy_Snakes@email.net")
    expect(created_customer.street_address).to eq("123 Python St")
    expect(created_customer.city).to eq("Reno")
    expect(created_customer.state_ab).to eq("NV")
  end

  it 'displays all subscriptions for a given customer' do

    cust_1 = FactoryBot.create(:customer)
    cust_2 = FactoryBot.create(:customer)

    subscription_1 = FactoryBot.create(:subscription)
    subscription_2 = FactoryBot.create(:subscription)
    subscription_3 = FactoryBot.create(:subscription)
    subscription_4 = FactoryBot.create(:subscription)

    c1_s1 = CustomerSubscription.create(customer_id: cust_1.id, subscription_id: subscription_1.id, status: 1)
    c1_s2 = CustomerSubscription.create(customer_id: cust_1.id, subscription_id: subscription_2.id, status: 1)
    c1_s3 = CustomerSubscription.create(customer_id: cust_1.id, subscription_id: subscription_3.id, status: 0)

    c2_s4 = CustomerSubscription.create(customer_id: cust_2.id, subscription_id: subscription_4.id, status: 0)

    get "/api/v1/customer_subscriptions/#{cust_1.id}"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_an(Array)
    expect(parsed[:data].count).to eq(3)

    parsed[:data].each_with_index do |subscription, index|
      expect(subscription).to be_a(Hash)
      expect(subscription).to have_key(:type)
      expect(subscription[:type]).to eq("customer_subscription")

      expect(subscription).to have_key(:attributes)
      expect(subscription[:attributes]).to be_a(Hash)

      expect(subscription[:attributes]).to have_key(:id)
      expect(subscription[:attributes][:id]).to be_an(Integer)

      expect(subscription[:attributes]).to have_key(:customer_id)
      expect(subscription[:attributes][:customer_id]).to be_an(Integer)

      expect(subscription[:attributes]).to have_key(:subscription_id)
      expect(subscription[:attributes][:subscription_id]).to be_an(Integer)

      expect(subscription[:attributes]).to have_key(:status)
      expect(subscription[:attributes][:status]).to be_an(Integer)
    end
  end

end