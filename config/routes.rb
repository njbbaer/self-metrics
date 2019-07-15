# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/summary')
  resources :summary, only: :index
  # resources :sessions, only: %i[new create destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  scope '/reports' do
    post '/sleep/start', to: 'sleep_reports#start'
    patch '/sleep/stop', to: 'sleep_reports#stop'

    resources :weight, as: 'weight_reports', controller: 'weight_reports'
    resources :cardio, as: 'cardio_reports', controller: 'cardio_reports'
    resources :sleep, as: 'sleep_reports', controller: 'sleep_reports'
  end
end
