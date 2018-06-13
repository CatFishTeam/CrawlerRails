Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/about'
  get 'scoring', to: 'scoring#index'
  get '/scoring/search', to: 'scoring#search'
  get 'spider', to: 'spider#index'
  post '/spider/search', to: 'spider#search'
  post '/spider/list', to: 'spider#list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'crawltemp', to: 'crawltemp#index'
  post '/crawltemp/search', to: 'crawltemp#search'

  get 'add-website', to: 'home#addWebsite'

end
