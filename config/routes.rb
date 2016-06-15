Rails.application.routes.draw do
  
  # pages related to the welcome/signup process
  
  get 'welcome' => 'static_pages#welcome'

  get 'videos' => 'static_pages#videos'

  get 'signup' => 'users#new'
  
  resources :users
  
  # root page will be the log in page, not the signup pages.

end
