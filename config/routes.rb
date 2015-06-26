Rails.application.routes.draw do
  devise_for :users

  resources :events do
    post 'calculate'
    resources :product_lists do
      put 'add_user'
    end
  end
  resources :users
  resources :invites

  get 'events/invites'
  root 'users#show'

end
