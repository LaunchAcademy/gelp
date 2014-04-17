
Gelp::Application.routes.draw do
  resources :ruby_gems do
    resources :reviews
  end

  resources :votes, only:[:create, :update]

  devise_for :users
  root "welcome#index"
end
