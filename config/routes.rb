Rails.application.routes.draw do
  resources :items do
    resources :claims, only: [:create, :destroy]
   end 
  devise_for :users
  resources :users, only: [:update, :show] do 
    get "profile", on: :member  #/users/123/profile
  end

  resources :user_profiles

  get 'welcome/index'
  get 'welcome/about'

  root to: 'welcome#index'
 
end
