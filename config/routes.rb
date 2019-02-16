# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :trips
    resources :vehicles

    root to: 'users#index'
  end
  resources :trips
  devise_for :users, skip: [:registration]
  root to: 'static#homepage'
end
