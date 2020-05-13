# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: :create
      resources :users, only: %i[show], param: :token
      resources :projects, only: %i[index create]
    end
  end

  root to: 'home#index'
  get '/*path', to: 'home#index'
end
