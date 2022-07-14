Rails.application.routes.draw do
  root "static_pages#home"
  get '/users', to: 'users#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
