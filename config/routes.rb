Rails.application.routes.draw do
  # Articles routes
  root "articles#home"
  resources :articles

  # signup route
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end 
