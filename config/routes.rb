Rails.application.routes.draw do
  resources :appointments
  resources :employees
  devise_for :receptionists
  post "/receptionists/sign_in", to: 'employees#index'
  get "/receptionists/edit", to: 'employees#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
