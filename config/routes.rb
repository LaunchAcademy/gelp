Gelp::Application.routes.draw do
  resources :ruby_gems

  devise_for :users

  namespace :admin do
    resources :users, only: :index
  end

  root "welcome#index"
end
