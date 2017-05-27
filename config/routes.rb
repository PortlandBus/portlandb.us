Rails.application.routes.draw do

  get "/about", to: "static#about"
  get "/media", to: "static#media"

  resources :volunteers
  resources :writeups
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static#home'

end
