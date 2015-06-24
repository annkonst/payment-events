Rails.application.routes.draw do
  devise_for :users

  resources :events do
    resource :purchases
    resource :list_of_purchases
  end
  resources :users
  resources :invites

  get 'events/invites'
  root 'users#show'

end
