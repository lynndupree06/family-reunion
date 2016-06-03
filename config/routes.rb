Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :people

  get '/register' => 'home#register'
  post '/register' => 'home#new_registration'

  get '/family' => 'family#index'
end
