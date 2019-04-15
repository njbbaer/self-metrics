# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/summary')
  resources :summary, only: :index
  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  scope '/reports' do
    resources :weight, as: 'weight_reports', controller: 'weight_reports'
    resources :sleep, as: 'sleep_reports', controller: 'sleep_reports'
    resources :cardio, as: 'cardio_reports', controller: 'cardio_reports'
  end
end
