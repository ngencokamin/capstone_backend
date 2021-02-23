Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # Users
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    # Media
    get "/media" => "media#index"
    get "/media/:id" => "media#show"
  end
end
