Rails.application.routes.draw do
  resources :items

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'
 
end
