Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # For Users
  resource :users, only: [:create]
  post "/auth/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  post "/user/confirm", to: "users#confirm"
  post "/user/create", to: "users#create"
  get "/user/list", to: "users#list"
  post "/user/list/user", to: "users#list_user"
  get "/detail", to: "users#details"
  put "/update", to: "users#update"
  put "/user/get", to: "users#get"
  put "/user/delete", to: "users#delete"
  # For Posts
  get "/post/list", to: "posts#list"
  post "/post/list/user", to: "posts#list_user"
  post "/post/confirm", to: "posts#confirm"
  post "/post/create", to: "posts#create"
  put "/post/delete", to: "posts#delete"
  get "/post/detail", to: "posts#details"
  put "/post/edit", to: "posts#edit"
  put "/post/update", to: "posts#update"
  post "/post/upload", to: "posts#import"
  get "/post/download", to: "posts#export"
end
