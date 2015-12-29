Rails.application.routes.draw do
  devise_for :users

  resources :events do
    post 'calculate'
    get 'event_report'
    resources :product_lists do
      put 'add_user'
      put 'exit_list'
    end
  end
  resources :users do
    put 'delete_avatar'
  end
  resources :invites
  resources :products

  post 'products/change_product_list'
  post 'invites/update_amount'
  get 'events/invites'
  root 'users#show'
end