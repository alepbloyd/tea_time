module Response

  def customer_json_response(object, status = :ok)
    render json: CustomerSerializer.new(object), status: status
  end

end