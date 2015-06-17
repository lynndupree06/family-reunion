Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  post '/register' => 'home#register'
end
