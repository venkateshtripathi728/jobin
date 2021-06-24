Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :experiences, only: [:create, :update, :destroy]
  resources :organizations, only: [:create, :update, :destroy]
  resources :applies do 
    resources :interviews, only: [:create, :update, :destroy] do 
      resources :reviews, only: [:create, :update, :destroy]
    end
  end

  resources :contacts, only: [:create, :update, :destroy]
  resources :votes, only: [:create, :update, :destroy]
  resources :articles, only: [:index, :show]
  get 'myprofile', to: 'pages#profile', as: :profile

end
