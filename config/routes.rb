Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :user_goals, only: [:new, :create, :update, :index]
  resources :emotions, only: [:new, :create, :index, :update]
  resources :journals, only: [:new, :create, :index, :show]

  get "/dashboard", to: "users#dashboard"
  # get "/user_goals/new", to: "user_goals#new"
  # post "/user_goals", to: "user_goals#create"
  # patch "/user_goals/:id", to: "user_goals#update"
  # get "/user_goals", to: "user_goals#index"

  # get "/emotions/new", to: "emotions#new"
  # post "/emotions", to: "emotions#create"
  # get "/emotions", to: "emotions#index"

  # get "/journals/new", to: "journals#new"
  # post "/journals", to: "journals#create"
  # get "/journals", to: "journals#index"
  # get "/journals/:id", to: "journals#show"
end
