Rails.application.routes.draw do

  root 'formularies#index'

  devise_for :users

  resources :formularies
  scope "/admin" do
    resources :users
  end

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
  end

end
