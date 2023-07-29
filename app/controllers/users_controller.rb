class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @offers = @user.offers # récupère toutes les offres de l'utilisateur
  end
end
