Rails.application.routes.draw do
  devise_for :users

  resources :events
  resources :users
  resources :invites

  get 'events/invites'
  root 'users#show'

end
