Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/register' => 'home#register'
  post '/register' => 'home#new_registration'
end
