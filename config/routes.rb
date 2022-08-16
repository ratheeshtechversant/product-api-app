Rails.application.routes.draw do
  resources :products
  namespace :api do
    resources :products, defaults: {format: :json}
  end
end
