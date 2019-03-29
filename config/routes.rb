Rails.application.routes.draw do
  resources :sleep, as: 'sleep_reports', controller: 'sleep_reports'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
