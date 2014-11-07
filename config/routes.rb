Rails.application.routes.draw do

  root 'formularies#index'
  devise_for :users
  resources :formularies
  scope "/admin" do
    resources :users
  end

end
