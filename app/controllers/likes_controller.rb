class LikesController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def create
    if user_signed_in?
      @product = Product.find(params[:product_id])
      @like = Like.new(user_id: current_user.id, product_id: @product.id)

      if @like.save
        respond_to do |format|
          format.js
          format.html
          format.json { render json: { status: 'success' }, status: :created } # ajout de cette ligne
        end
      else
        respond_to do |format|
          format.js
          format.html
          format.json { render json: @like.errors, status: :unprocessable_entity } # ajout de cette ligne
        end
      end
    else
      render json: { error: "Non autorisé" }, status: 401
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.js
      format.html
      format.json { render json: { status: 'success' }, status: :ok } # ajout de cette ligne
    end
  end

end
