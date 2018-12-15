Rails.application.routes.draw do
  resources :secret_codes do
  	collection do
	    post :generate_codes
    end
  end
  devise_for :user, controllers: { registrations: "registrations" }

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"


end
