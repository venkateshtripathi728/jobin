Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :experiences, only: [:create, :update, :delete]
  resources :organizations, only: [:create, :update, :delete]
  resources :applications
  resources :contacts, only: [:create, :update, :delete]
  resources :interviews, only: [:create, :update, :delete]
  resources :reviews, only: [:create, :update, :delete]
  resources :votes, only: [:create, :update, :delete]
  resources :articles, only: [:index, :show]
  get 'myprofile', to: 'pages#profile', as: :profile
end
