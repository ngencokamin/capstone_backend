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

    # Media
    get "/media" => "media#index"
    get "/media/:id" => "media#show"
    post "/media" => "media#create"

    # Comments
    post "/comments" => "comments#create"
    patch "/comments/:id" => "comments#update"
    delete "/comments/:id" => "comments#destroy"

    # Votes
    post "/votes" => "votes#create"
    patch "/votes/:id" => "votes#update"
  end
end
