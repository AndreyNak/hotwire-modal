# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chats

  root 'chats#index'
end
