class AlertsController < ApplicationController
  before_action :set_alert, only: [:update, :destroy]

  def new
    @alert = Alert.new
  end

  def create
    @alert = Alert.new(alert_params)
    @alert.user = current_user
    if @alert.save
      redirect_to user_path(current_user), notice: 'Alerte créée avec succès.'
    else
      puts @alert.errors.full_messages # Ceci affichera les erreurs dans les logs
      render :new, alert: 'Erreur lors de la création de l\'alerte.'
    end
  end

  def update
    if @alert.update(alert_params)
      redirect_to @alert, notice: 'Alerte a été mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy
    redirect_to user_path(current_user), notice: 'Alerte supprimée avec succès.'
  end


  private
    # Utilisez des rappels pour partager la configuration ou les contraintes entre les actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # N'autorise que les paramètres de liste blanche à travers.
    def alert_params
      params.require(:alert).permit(:keyword, :max_price, :language)
    end
end
