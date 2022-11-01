class Api::V1::CustomerSubscriptionsController < ApplicationController

  def create
    customer_subscription = CustomerSubscription.new(customer_subscription_params)

    if customer_subscription.save
      customer_subscription_json_response(customer_subscription)
    else
      render status: 400
    end
  end

  private

  def customer_subscription_params
    params.require(:customer_subscription).permit(:customer_id, :subscription_id, :status)
  end

end