Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Golden seven: index, show, edit, new, create, update, delete
  #root 'vinyls#index'
  root 'sessions#index'

  # Resources for Vinyls
  get "/vinyls" => "vinyls#index"
  get "/vinyls/new" => "vinyls#new"
  post "/vinyls" => "vinyls#create"

  get "/vinyls/:id" => "vinyls#show"
  get "/vinyls/:id/edit" => "vinyls#edit"
  patch "/vinyls/:id" => "vinyls#update"
  delete "/vinyls/:id" => "vinyls#destroy"

  post "/vinyls/add-to-collections" => "vinyls#add" # add vinyl to collection
  post "vinyls/remove-from-collections" => "vinyls#remove" # remove vinyl from collection


  # Resources for Artists
  get "/artists" => "artists#index"
  get "/artists/new" => "artists#new"
  post "/artists" => "artists#create"

  get "/artists/:id" => "artists#show"
  get "/artists/:id/edit" => "artists#edit"
  patch "/artists/:id" => "artists#update"
  delete "/artists/:id" => "artists#destroy"


  # Resources for Users
  get "/users" => "users#index"
  get "/users/new" => "users#new"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  delete "/users/:id" => "users#destroy"
  get "/users/:id/edit" => "users#edit"
  patch "/users/:id" => "users#update"

  get "/sessions/new" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"


  # Resources for Collections
  get "/collections" => "collections#index"
  get "/collections/new" => "collections#new"
  post "/collections" => "collections#create"

  get "/collections/:id" => "collections#show"
  get "/collections/:id/edit" => "collections#edit"
  patch "/collections/:id" => "collections#update"
  delete "/collections/:id" => "collections#destroy"

  # Resources for Collection_Records (join table of vinyls and collections)
  #post "/collection-records" => "collection_records#create" # add vinyl to colleciton


end
