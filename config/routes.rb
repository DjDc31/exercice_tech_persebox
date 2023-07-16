Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :products, only: [:index, :show]
  resources :offers, only: [:show]
end
