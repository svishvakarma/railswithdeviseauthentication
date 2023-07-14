Rails.application.routes.draw do
  resources :feebacks
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations:'users/registrations'
  }
  post '/auth/login', to: 'authentication#login'
end