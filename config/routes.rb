Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "realestatetransactions/search" => "realestatetransactions#search", as: :search_transactions
      resources :realestatetransactions
    end
  end
end
