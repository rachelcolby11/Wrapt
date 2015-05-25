Rails.application.routes.draw do
  resources :items
  devise_for :users
  resources :users, only: [:update]
  resources :user_profiles

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
 
end
