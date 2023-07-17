Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :offers, only: [:show, :create]
  resources :products, only: [:index, :show] do
    member do
      post 'like', to: 'products#like', as: 'like'
      delete 'unlike', to: 'products#unlike', as: 'unlike'
    end
  end
  get '/contact', to: 'pages#contact', as: 'contact'
  match '/select_product', to: 'offers#select_product', via: [:get, :post], as: 'select_product'
  post '/create_offer', to: 'offers#create_offer', as: 'create_offer'

  get '/liked_products', to: 'products#liked', as: 'liked_products'
  delete '/products/:id/like', to: 'products#unlike', as: 'product_unlike'
end
