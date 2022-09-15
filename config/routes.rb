Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :listings
  get "/api/listings" => "pages#api_listings_index"
  get "/api/listings/:id" => "pages#api_listings_show"
end
