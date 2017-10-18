Rails.application.routes.draw do
  root 'home#index'
	devise_for :users, :controllers => { registrations: 'registrations' }

	resources :posts do
		resources :comments
	end
end
