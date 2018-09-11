Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'lists#show'
  resource :lists
  get 'get_items' => 'lists#get_items'
  post 'add_item' => 'lists#add_item'
  delete 'remove_item' => 'lists#remove_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
