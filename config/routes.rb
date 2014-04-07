Gelp::Application.routes.draw do
  resources :ruby_gems

  devise_for :users
  root "welcome#index"
end
