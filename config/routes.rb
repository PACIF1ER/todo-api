Rails.application.routes.draw do
# API
  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :create, :destroy] do
        post :complete, to: "tasks#complete"
      end

      resources :users, only: [:create]
      resources :sessions, only: [:create]
    end
  end
end
