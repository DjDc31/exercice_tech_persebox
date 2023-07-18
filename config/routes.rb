Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :offers, only: [:show, :create]
  resources :products, only: [:index, :show] do
    resources :likes, only: [:create]
  end

  resources :likes, only: [:destroy]

  post 'products/:product_id/like', to: 'likes#create', as: 'like_product'


  get '/contact', to: 'pages#contact', as: 'contact'
  match '/select_product', to: 'offers#select_product', via: [:get, :post], as: 'select_product'
  post '/create_offer', to: 'offers#create_offer', as: 'create_offer'

  get '/liked_products', to: 'products#liked', as: 'liked_products'
end
