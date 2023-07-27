class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @products = Product.includes(:offers)
    if params[:donations].present?
      @products = @products.joins(:offer).where(offers: { don: true })
    elsif params[:query].present?
      sql_subquery = <<~SQL
        products.marque ILIKE :query
        OR products.modele ILIKE :query
        OR products.content ILIKE :query
        OR products.couleur ILIKE :query
      SQL
      @products = @products.where(sql_subquery, query: "%#{params[:query]}%").distinct
    end
    sort_products
  end

  def show
    @product = Product.find(params[:id])
    @sorted_offers = sort_offers
  end

  def liked
    @liked_products = current_user.likes.map(&:product)
  end

  private

  def sort_products
    if params[:sort].present?
      case params[:sort]
      when "price_asc"
        @products = @products.order("offers.price ASC")
      when "price_desc"
        @products = @products.order("offers.price DESC")
      when "alphabetical"
        @products = @products.order(marque: :asc)
      end
    end
  end

  def sort_offers
    sorted_offers = @product.offers
    if params[:sort].present?
      case params[:sort]
      when "price_asc"
        sorted_offers = sorted_offers.order(price: :asc)
      when "price_desc"
        sorted_offers = sorted_offers.order(price: :desc)
      when "alphabetical"
        sorted_offers = sorted_offers.order(etat: :asc)
      end
    end
    sorted_offers
  end
end
