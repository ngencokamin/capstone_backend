Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # Users
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    get "/users/:id" => "users#show"

    # Media
    get "/media" => "media#index"
    get "/media/:id" => "media#show"
  end
end
