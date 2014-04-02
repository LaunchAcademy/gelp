Gemmerator::Application.routes.draw do
  resources :ruby_gems #, only: [:new]
  # This made everything break, why did Helen betray us??? >:(
end
