Rails.application.routes.draw do
  # Articles routes
  root "articles#home"
  resources :articles

  # signup route
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # login route
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end 
