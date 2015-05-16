Rails.application.routes.draw do
  resources :projects
  root to: 'application#welcome'
  resources :pages
  devise_for :users
end
