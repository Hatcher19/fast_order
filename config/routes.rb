Rails.application.routes.draw do

	resources :orders
	resources :addresses 
	resources :line_items, shallow: true do
   		collection { post :import }
   end

	devise_for :users, :controllers => { registrations: 'users/registrations' }
	
	root "pages#home"
	get "faq" => "pages#faq"
end
