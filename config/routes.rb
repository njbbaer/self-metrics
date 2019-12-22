# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/summary')
  resources :summary, only: :index
  # resources :sessions, only: %i[new create destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/reports', to: redirect('/')
  scope '/reports' do
    resources :weight, as: 'weight_reports', controller: 'weight_reports'
    resources :cardio, as: 'cardio_reports', controller: 'cardio_reports'
    resources :sleep, as: 'sleep_reports', controller: 'sleep_reports' do
      post :start, on: :collection
      patch :stop, on: :collection
    end
  end
end
