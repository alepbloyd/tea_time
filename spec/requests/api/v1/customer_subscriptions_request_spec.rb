require 'rails_helper'

describe 'Customer Subscriptions API' do

  it 'creates a new subscription' do
    cust_1 = FactoryBot.create(:customer)
    subscription_1 = FactoryBot.create(:subscription)

    customer_subscription_params = {
      customer_id: cust_1.id,
      subscription_id: subscription_1.id,
      status: true
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/subscription/", headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

    expect(response).to be_successful

    created_c_t = CustomerSubscription.last

    expect(created_c_t.customer_id).to eq(cust_1.id)
    expect(created_c_t.subscription_id).to eq(subscription_1.id)
  end

  it 'cancels an existing subscription' do
    cust_1 = FactoryBot.create(:customer)
    subscription_1 = FactoryBot.create(:subscription)

    customer_subscription_params = {
      customer_id: cust_1.id,
      subscription_id: subscription_1.id,
      status: 1
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/subscription/", headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

    expect(CustomerSubscription.count).to eq(1)
    expect(CustomerSubscription.last.status).to eq(1)

    subscription_status_params = {
      customer_id: cust_1.id,
      subscription_id: subscription_1.id
    }

    patch "/api/v1/subscription/", headers: headers, params: JSON.generate(subscription_status: subscription_status_params)

    c_s = CustomerSubscription.find_by(customer_id: cust_1.id, subscription_id: subscription_1.id)

    expect(c_s.status).to eq(0)
  end

  it 'activates an inactive subscription' do
    cust_1 = FactoryBot.create(:customer)
    subscription_1 = FactoryBot.create(:subscription)

    customer_subscription_params = {
      customer_id: cust_1.id,
      subscription_id: subscription_1.id,
      status: 0
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/subscription/", headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

    c_s_prepatch = CustomerSubscription.find_by(customer_id: cust_1.id, subscription_id: subscription_1.id)
    expect(c_s_prepatch.status).to eq(0)

    subscription_status_params = {
      customer_id: cust_1.id,
      subscription_id: subscription_1.id
    }

    patch "/api/v1/subscription/", headers: headers, params: JSON.generate(subscription_status: subscription_status_params)

    c_s_postpatch = CustomerSubscription.find_by(customer_id: cust_1.id, subscription_id: subscription_1.id)

    expect(c_s_postpatch.status).to eq(1)
  end
end