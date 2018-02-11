Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Golden seven: index, show, edit, new, create, update, delete
  root 'vinyls#index'

  # Resources for Vinyls
  get "/vinyls" => "vinyls#index"
  get "/vinyls/new" => "vinyls#new"
  post "/vinyls" => "vinyls#create"

  get "/vinyls/:id" => "vinyls#show"
  get "/vinyls/:id/edit" => "vinyls#edit"
  patch "/vinyls" => "vinyls#update"
  delete "/vinyls/:id" => "vinyls#destroy"

  # Resources for Artists
  get "/artists" => "artists#index"
  get "/artists/new" => "artists#new"
  post "/artists" => "artists#create"

  get "/artists/:id" => "artists#show"
  get "/artists/:id/edit" => "artists#edit"
  patch "/artists" => "artists#update"
  delete "/artists/:id" => "artists#destroy"

end
