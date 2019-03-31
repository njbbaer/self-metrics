Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/reports' do
    resources :weight, as: 'weight_reports', controller: 'weight_reports'
    resources :sleep, as: 'sleep_reports', controller: 'sleep_reports'
  end
end
