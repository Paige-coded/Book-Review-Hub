Rails.application.routes.draw do
  devise_for :users
  get "reviews/new"
  get "reviews/create"
  get "reviews/destroy"
  resources :books do
    resources :reviews, only: [:new, :create, :destroy]
  end
  root "books#index"
end
