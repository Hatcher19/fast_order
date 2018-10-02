Rails.application.routes.draw do
  resources :line_items
  resources :orders
  devise_for :users
  root "pages#home"
  get "faq" => "pages#faq"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
