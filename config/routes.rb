Rails.application.routes.draw do
	match 'line_item/:order_value', to: 'line_item#new', as: 'new_line_item', :via => [:get]
	resources :line_items
	resources :orders 
	devise_for :users
	root "pages#home"
	get "faq" => "pages#faq"
end
