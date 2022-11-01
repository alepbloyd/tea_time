Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post "/customers", to: "customers#create"
      post "/subscription", to: "customer_subscriptions#create"
      patch "/subscription", to: "customer_subscriptions#update"
    end
  end

end
