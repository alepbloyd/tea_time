Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post "/customers", to: "customers#create"
      post "/customer_subscriptions", to: "customer_subscriptions#create"
      patch "/customer_subscriptions", to: "customer_subscriptions#update"

      get "/customer_subscriptions/:customer_id", to: "customer_subscriptions#index"
    end
  end

end
