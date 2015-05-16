Rails.application.routes.draw do
  root to: 'application#welcome'
  resources :pages
  devise_for :users
end
