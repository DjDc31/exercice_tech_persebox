class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @offers = @user.offers
    @alerts = @user.alerts # Utilisez le pluriel ici pour indiquer que c'est une collection
    @new_alert = Alert.new # Vous pouvez utiliser une autre variable pour le nouvel objet Alert si nécessaire
  end


  def delete_alert
    alert = Alert.find(params[:alert_id])
    alert.destroy
    redirect_to user_path(current_user), notice: 'Alerte supprimée avec succès.'
  end

  def update
    # logique de mise à jour

    respond_to do |format|
      if @alert.update(alert_params)
        format.js   # Rendre une vue JS si la mise à jour réussit
      else
        format.html { render :edit }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end


end
