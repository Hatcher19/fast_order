Rails.application.routes.draw do

	resources :orders 
	resources :line_items, shallow: true do
   		collection { post :import }
   end

	devise_for :users
	root "orders#index"
	get "faq" => "pages#faq"
end
