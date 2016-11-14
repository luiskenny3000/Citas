Rails.application.routes.draw do

  get '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :reservations
  resources :disables
  resources :admins
  resources :rooms
  resources :teachers
  resources :observations
  resources :resources
  resources :departments
  resources :centers

  root "rooms#index"
  get '/calendar', to: 'public#calendar', as: "calendar"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
