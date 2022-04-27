Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "reserve#home" 
  get "reserve/search", to: "reserve#search"
  get "reserve/new", to: "reserve#new"
  get "reserve/show", to: "reserve#show"
  get "reserve/:id", to: "reserve#room"

  post "reserve/create", to: "reserve#create"


  
  get "reserved/:id/new", to: "reserved#new"
  get "reserved/show", to: "reserved#show"

  post "reserved/:id/create", to: "reserved#create"


  get "user/sign_up", to: "user#new"
  get "user/sign_in", to: "user#sign_in"
  get "user/logout", to: "user#logout"
  get "user/account", to: "user#account"
  get "user/profile", to: "user#profile"
  get "user/edit", to: "user#edit"

  post "user/login", to: "user#login"
  post "user/create", to: "user#create"
  post "user/:id/update", to: "user#update" 
end
