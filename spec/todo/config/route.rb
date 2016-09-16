TodoApplication.routes.draw do
  get "/", to: "todo#index"
  get "/todo/new", to: "todo#new"
  post "/todo/create", to: "todo#create"
  get "/todo/:id/show", to: "todo#show"
  get "/todo/:id/edit", to: "todo#edit"
  put "/todo/:id/update", to: "todo#update"
  delete "/todo/:id/destroy", to: "todo#destroy"

  get "/todo/about_me", to: "todo#about_me"
end
