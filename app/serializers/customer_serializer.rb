class CustomerSerializer
  include JSONAPI::Serializer

  attributes :id, :first_name, :last_name, :email, :street_address, :city, :state_ab
end