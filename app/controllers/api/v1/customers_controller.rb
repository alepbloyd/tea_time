class Api::V1::CustomersController < ApplicationController

  def create
    customer = Customer.new(customer_params)

    if customer.save
      customer_json_response(customer)
    else
      render status: 400
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:email,:street_address,:city,:state_ab)
  end

end