Rails.application.routes.draw do
  # Home & About
  root "pages#home"
  get 'about', to: 'pages#about'
  resources :articles

  # Signup routes
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # Login & Logout routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  # Category routes
  resources :categories, except: [:destroy]
end 
