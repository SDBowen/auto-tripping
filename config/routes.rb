# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :trips
    resources :vehicles

    root to: 'users#index'
  end
  resources :trips do
    collection do
      get 'enter_time'
    end
  end
  devise_for :users, skip: [:registration]
  root to: 'static#homepage'
end
