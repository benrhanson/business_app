Rails.application.routes.draw do
  
  # pages related to the welcome/signup process
  get 'static_pages/welcome'

  get 'static_pages/videos'

  get 'users/new'
  
  # root page will be the log in page, not the signup pages.

 
end
