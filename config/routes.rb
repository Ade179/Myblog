Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"


  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
    resources :likes
  end
  scope :api, defaults: { format: :json }, module: :api, constraints: { subdomain: 'api' } do
    scope :v1 do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
end
