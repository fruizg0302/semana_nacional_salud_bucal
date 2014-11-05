Rails.application.routes.draw do

  root 'formularies#index'
  devise_for :users
  resources :formularies
  
end
