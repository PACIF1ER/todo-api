Rails.application.routes.draw do
# API
  namespace :api do
    namespace :v1 do
      resources :tasks, defaults: {format: :json}
      resources :users, only: [:create]
      resources :sessions, only: [:create]
    end
  end
end
