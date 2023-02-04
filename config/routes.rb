Rails.application.routes.draw do
  # Articles routes
  root "pages#home"
  get 'about', to: 'pages#about'
  resources :articles

  # signup route
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # login route
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end 
