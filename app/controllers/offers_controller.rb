class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
    @product = Product.find(params[:id])

  end

  def create_offer
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    if @offer.save
      redirect_to @offer.product, notice: "L'offre a été ajoutée avec succès!"
    else
      render :new
    end
  end

  def select_product
    @products = Product.all
    @offer = Offer.new
  end

  private

  def offer_params
    params.require(:offer).permit(:product_id, :price, :extra, :content, :language, :etat)
  end
end
