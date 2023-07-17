class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def liked
    @liked_products = current_user.likes.map(&:product)
  end


  def like
    @product = Product.find(params[:id])
    current_user.likes.create(product: @product)
    # Redirection ou autre traitement
  end

  def unlike
    @product = Product.find(params[:id])
    current_user.likes.find_by(product: @product)&.destroy
    # Redirection ou autre traitement
  end



end
