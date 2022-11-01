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

end