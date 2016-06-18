Rails.application.routes.draw do
  
  get 'sessions/new'

  # pages related to the welcome/signup process
  
  get 'welcome' => 'static_pages#welcome'

  get 'videos' => 'static_pages#videos'

  get 'signup' => 'users#new'
  
  resources :users
  
  root 'users#new'
  
  get 'login' => 'sessions#new'
  
  post 'login' => 'sessions#create'
  
  delete 'logout' => 'sessions#destroy'
  
  # root page will eventually be the log in page, not the signup pages.

end
