class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
    @product = Product.find(params[:product_id])
    @similar_offers = Offer.joins(:product).where('products.marque = ? AND products.modele = ?', @product.marque, @product.modele)
  end

  def set_product
    redirect_to new_offer_path(product_id: params[:product_id])
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

  def my_offers
    @offers = current_user.offers.joins(:product).order('products.marque ASC')
  end

  def destroy
    @offer = Offer.find(params[:id])

    if @offer.user == current_user
      @offer.destroy
      flash[:notice] = "L'offre a été supprimée avec succès."
      redirect_to my_offers_path
    else
      flash[:alert] = "Vous n'avez pas le droit de supprimer cette offre."
    end

  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to my_offers_path, notice: 'L\'offre a été modifiée avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:product_id, :price, :extra, :content, :language, :etat)
  end
end
