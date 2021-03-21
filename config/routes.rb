Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # Users
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    get "/users/:id" => "users#show"
    patch "/users/me" => "users#update"
    delete "/users/me" => "users#destroy"
    delete "/users/me/trello" => "users#trello_destroy"

    # Media
    get "/media" => "media#index"
    get "/media/:id" => "media#show"
    get "/omdb_media/:search" => "media#omdb_index"
    post "/media" => "media#create"

    # Comments
    post "/comments" => "comments#create"
    patch "/comments/:id" => "comments#update"
    delete "/comments/:id" => "comments#destroy"

    # Votes
    post "/votes" => "votes#create"
    patch "/votes/:id" => "votes#update"

    # Saved Shows
    get "/saved_shows/:id" => "saved_shows#index"
    post "/saved_shows/" => "saved_shows#create"
    patch "/saved_shows/:id" => "saved_shows#update"
    delete "/saved_shows/:id" => "saved_shows#destroy"
  end
end
