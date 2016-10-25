Rails.application.routes.draw do
  resources :teachers
  resources :observations
  resources :resources
  resources :resouces
  resources :departments
  resources :centers
  root "centers#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
