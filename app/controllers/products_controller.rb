class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @products = Product.all

    if params[:donations].present?
      @products = @products.joins(:offer).where(offers: { don: true })
    elsif params[:query].present?
      sql_subquery = <<~SQL
        products.marque ILIKE :query
        OR products.modele ILIKE :query
        OR products.content ILIKE :query
        OR products.couleur ILIKE :query
        OR users.nickname ILIKE :query
      SQL
      @products = @products.joins(:users).where(sql_subquery, query: "%#{params[:query]}%").distinct
    end

    # sort = params[:sort] || 'price_asc'
    # @products = sort_products(@products, sort)
  end

  def show
    @product = Product.find(params[:id])
  end

  def liked
    @liked_products = current_user.likes.map(&:product)
  end


  private

  def sort_products(products, sort)
    case sort
    when 'price_asc'
      products.order(price: :asc)
    when 'price_desc'
      products.order(price: :desc)
    when 'alphabetical'
      products.order(marque: :asc)
    else
      products
    end
  end
end
