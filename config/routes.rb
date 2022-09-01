Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :user_goals, only: [:new, :create, :update, :index]
  resources :emotions, only: [:new, :create, :index, :update]
  resources :journals, only: [:new, :create, :index, :show, :edit, :update]
  resources :articles, only: [:index]

  get "/dashboard", to: "users#dashboard"
end
