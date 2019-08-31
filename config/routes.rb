Rails.application.routes.draw do
  # AuthController#login

  # send a request and give a token
  post '/login', to: "auth#login"

  # send a request to create a user
  post '/signup', to: "users#create"

  # give all the user info i need to render
  get '/profile', to: "users#profile"
end
