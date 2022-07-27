Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root "static_pages#home"
    resources :users
    resources :contacts
    resources :shops
    resources :products
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
