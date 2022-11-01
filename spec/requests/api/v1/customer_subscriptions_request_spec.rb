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

    post "/api/v1/subscribe/", headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

    expect(response).to be_successful

    created_c_t = CustomerSubscription.last

    expect(created_c_t.customer_id).to eq(cust_1.id)
    expect(created_c_t.subscription_id).to eq(subscription_1.id)
  end
end