TodoApplication.routes.draw do
  get "/todo", to: "todo#index"
  get "/todo/:id", to: "todo#show"
  get "/todo/new", to: "todo#new"
  get "/todo/:id/edit", to: "todo#edit"
  post "/todo/:id", to: "todo#create"
  put "/todo/:id", to: "todo#update"
  patch "/todo/:id", to: "todo#update"
  delete "/todo/:id", to: "todo#destroy"

  get "/todo/about_me", to: "todo#about_me"
end
