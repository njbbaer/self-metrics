# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/summary')
  resources :summary, only: :index
  scope '/reports' do
    resources :weight, as: 'weight_reports', controller: 'weight_reports'
    resources :sleep, as: 'sleep_reports', controller: 'sleep_reports'
    resources :cardio, as: 'cardio_reports', controller: 'cardio_reports'
  end
end
