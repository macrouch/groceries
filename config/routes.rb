Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'lists#show'
  get 'lists/show'
  get 'get_items' => 'lists#get_items'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
