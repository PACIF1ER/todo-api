Rails.application.routes.draw do
# API
  namespace :api do
    namespace :v1 do
      resources :tasks, defaults: {format: :json}
      # resources :users, only: [:create]
      resources :users do
	    member do
	      get :confirm_email
	    end
	    collection do
	      post :create 
	    end
	  end

      resources :sessions, only: [:create]
    end
  end
end





 
#   resources :tasks do
#     member do
#       get :completed
#     end
#     collection do
#       delete 'destroy_multiple'
#       post :fetch_tasks
#       post :sort
#     end
#   end

#   resources :users do
#     member do
#       get :confirm_email
#     end
#     collection do
#       post :fetch_token
#       post :create_token
#       post :destroy_token
#     end
#   end
# end