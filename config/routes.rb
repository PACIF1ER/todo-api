Rails.application.routes.draw do
	  post 'authenticate', to: 'authentication#authenticate'
  resources :todos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end