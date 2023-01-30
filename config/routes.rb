Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "articles#home"
  
  resources :articles

end 
