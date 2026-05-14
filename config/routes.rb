Rails.application.routes.draw do
  get "reviews/new"
  get "reviews/create"
  get "reviews/destroy"
  resources :books do
    resources :reviews, only: [:new, :create, :destroy]
  end
  root "books#index"
end
