Rails.application.routes.draw do
  devise_for :users


  resources :events
  resources :users

  get 'events/invites'

  root 'users#show'

end
