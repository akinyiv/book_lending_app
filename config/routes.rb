Rails.application.routes.draw do
  # Authentication routes
  get "/signup", to: "users#new", as: :signup
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  # Books routes
  resources :books, only: [:index, :show] do
    post :borrow, to: "borrowings#create", on: :member
  end

  # Borrowings routes
  resources :borrowings, only: [:create, :destroy]

  # User profile route
  get "/profile", to: "profiles#profile", as: :user_profile

  # Users routes (signup)
  resources :users, only: [:new, :create], path: "signup"

  # Root route
  root "books#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
