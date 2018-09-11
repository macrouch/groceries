Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'lists#show'
  resources :lists
  get 'get_items' => 'lists#get_items'
  post 'add_item' => 'lists#add_item'
  delete 'remove_item' => 'lists#remove_item'
  get 'join/:join_key' => 'lists#join', as: :join_list
  put 'new_join_link/:list_id' => 'lists#new_join_link', as: :new_join_link

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
