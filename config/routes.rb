
Gelp::Application.routes.draw do
  resources :ruby_gems do
    resources :reviews
  end

  resources :votes, only:[:create, :update]

  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :reviews, only: [:index, :destroy]
    resources :ruby_gems, only: [:destroy]
  end

  root "welcome#index"
end
