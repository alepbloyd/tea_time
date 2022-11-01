class Api::V1::CustomerSubscriptionsController < ApplicationController

  def index
    customer_subscriptions = CustomerSubscription.where(customer_id: params[:customer_id])

    customer_subscription_json_response(customer_subscriptions)
  end

  def create
    customer_subscription = CustomerSubscription.new(customer_subscription_params)

    if customer_subscription.save
      customer_subscription_json_response(customer_subscription)
    else
      render status: 400
    end
  end

  def update
    customer_subscription = CustomerSubscription.find_by(customer_id: subscription_status_params[:customer_id], subscription_id: subscription_status_params[:subscription_id])

    if customer_subscription.status == 1
      customer_subscription.update(status: 0)
    else
      customer_subscription.update(status: 1)
    end
  end

  private

  def customer_subscription_params
    params.require(:customer_subscription).permit(:customer_id, :subscription_id, :status)
  end

  def subscription_status_params
    params.require(:subscription_status).permit(:customer_id, :subscription_id)
  end

end