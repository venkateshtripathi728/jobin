Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :experiences, only: [:create, :update, :destroy]
  resources :organizations, only: [:create, :destroy]
  post 'coforg', to: 'organizations#createorfind'
  resources :applies do
    resources :organizations, only: [ :edit, :update]
    member do
      patch "/change_status", to:'applies#change_status'
      patch "/accept", to:'applies#accept'
      patch "/decline", to:'applies#decline'
    end
    resources :notification_applies, only: [:create]
    resources :contacts, only: [:create, :update, :destroy]
    resources :interviews, only: [:create, :update, :destroy] do
      resources :reviews, only: [:create, :update, :destroy] do
        patch "/upvote", to:"reviews#upvote"
        patch "/downvote", to:"reviews#downvote"
      end
    end
  end
  resources :votes, only: [:create, :update, :destroy]
  resources :articles, only: [:index, :show]
  get 'myprofile', to: 'pages#profile', as: :profile

end
