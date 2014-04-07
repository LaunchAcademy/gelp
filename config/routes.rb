Gemmerator::Application.routes.draw do
  resources :ruby_gems do
    resources :reviews
  end

  devise_for :users
  root "welcome#index"
end
