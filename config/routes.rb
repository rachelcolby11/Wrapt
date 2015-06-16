Rails.application.routes.draw do
  resources :items do
    get "restrictions", on: :member
    resources :claims, only: [:create, :destroy]
    resources :exclusions, only: [:create, :destroy]
   end 
  devise_for :users
  resources :users, only: [:update, :show] do 
    get "profile", on: :member  #/users/123/profile
  end

  resources :friendships, only: [:create, :destroy, :index]

  resources :user_profiles

  namespace :admin do
    resources :users
  end

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/dashboard'

  root to: 'welcome#index'
 
end
