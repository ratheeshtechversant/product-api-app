Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }, defaults: { format: :json }
  get '/member-data',to: 'members#show'
  resources :products
  namespace :api do
    resources :products, defaults: {format: :json}
    resources :carts, defaults: {format: :json}
    resources :cart_items, defaults: {format: :json}
    resources :cart_items,defaults: {format: :json} do
      
      collection do
        post 'cartitems'
      end
    end

  end
end
