class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @products = Product.all
    if params[:query].present?
      sql_subquery = <<~SQL
        products.marque ILIKE :query
        OR products.modele ILIKE :query
        OR products.content ILIKE :query
        OR products.couleur ILIKE :query
        OR users.nickname ILIKE :query
      SQL
      @products = @products.joins(:users).where(sql_subquery, query: "%#{params[:query]}%")
    end
    # params[:query] = nil
  end

  def show
    @product = Product.find(params[:id])
  end

  def liked
    @liked_products = current_user.likes.map(&:product)
  end
end
