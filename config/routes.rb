Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }, defaults: { format: :json }
  get '/member-data',to: 'members#show'
  # devise_for :users, defaults: { format: :json }
  resources :products
  namespace :api do
    resources :products, defaults: {format: :json}
  end
end
