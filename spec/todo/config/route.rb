TodoApplication.routes.draw do
  root "todo#index"
  get "/", to: "todo#index"
  get "/todo/new", to: "todo#new"
  post "/todo/create", to: "todo#create"
  get "/todo/:id/show", to: "todo#show"
  get "/todo/:id/edit", to: "todo#edit"
  put "/todo/:id/update", to: "todo#update"
  delete "/todo/:id/destroy", to: "todo#destroy"
end
