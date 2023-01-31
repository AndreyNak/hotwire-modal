# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :chats , only: %i[index new show create]do
    resources :messages
  end

  resources :notifications, only: [:index]

  get '/dashboard', to: 'dashboard#index'
  root to: 'dashboard#index'
end
