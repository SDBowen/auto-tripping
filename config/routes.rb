Rails.application.routes.draw do
  resources :trips
  devise_for :users
  root to: 'static#homepage'
end
