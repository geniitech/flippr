Rails.application.routes.draw do
  resources :projects
  root to: 'application#welcome'
  devise_for :users
end
