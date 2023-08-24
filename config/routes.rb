Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post '/login', to: 'sessions#create'
  post '/signup', to: 'registrations#create'
  
  root "doctors#index"
  resources :doctors do
    resources :appointments, only: %i[new create index destroy]
  end
  resources :appointments, only: [:index]
end
