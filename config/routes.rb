Rails.application.routes.draw do
  devise_for :users

  resources :events do
    get 'calculate'
    get 'event_report'
    resources :product_lists do
      put 'add_user'
      put 'destroy_product'
    end
  end
  resources :users
  resources :invites
  resources :products

  get 'events/invites'
  root 'users#show'
end