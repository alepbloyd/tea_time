module Response

  def customer_json_response(object, status = :ok)
    render json: CustomerSerializer.new(object), status: status
  end

  def customer_subscription_json_response(object, status = :ok)
    render json: CustomerSubscriptionSerializer.new(object), status: status
  end

end