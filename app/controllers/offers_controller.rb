class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
    @product = Product.find(params[:product_id])
    @similar_offers = Offer.joins(:product).where('products.marque = ? AND products.modele = ?', @product.marque, @product.modele)
    @lowest_offer = @product.offers.order(price: :asc).first
  end

  def set_product
    @product = Product.find_by(modele: params[:product_model])
    redirect_to new_offer_path(product_id: @product.id)
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    if @offer.save
      redirect_to my_offers_path, notice: "L'offre a été ajoutée avec succès!"
    else
      @product = Product.find(params[:product_id])
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

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def check_user
    if current_user != @offer.user
      redirect_to offers_path, alert: "Vous n'êtes pas autorisé à modifier cette offre."
    end
  end
end
