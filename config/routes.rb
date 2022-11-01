Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post "/customers", to: "customers#create"
      post "/subscriptions", to: "customer_subscriptions#create"
      patch "/subscriptions", to: "customer_subscriptions#update"

      get "/subscriptions/:customer_id", to: "customer_subscriptions#index"
    end
  end

end
