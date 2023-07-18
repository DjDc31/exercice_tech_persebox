class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @like = Like.new(user_id: current_user.id, product_id: @product.id)

    if @like.save
      respond_to do |format|
        format.js
        format.html
      end
    else
      respond_to do |format|
        format.js
        format.html
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.js
      format.html
    end
  end

end
