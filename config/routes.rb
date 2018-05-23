Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/about'
  get 'spider', to: 'spider#index'
  get '/search/:url', to: 'spider#seach'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
