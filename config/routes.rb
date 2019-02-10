# frozen_string_literal: true

Rails.application.routes.draw do
  resources :trips
  devise_for :users, skip: [:registration]
  root to: 'static#homepage'
end
