class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications
  before_action :load_products


  protected

  def load_products
    @products = Product.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :first_name, :last_name, :address, :date_birth, :description])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :address, :date_birth, :description])
  end

  private

  def set_notifications
    if user_signed_in?
      # Ici, vous définissez la logique pour charger les alertes pour l'utilisateur connecté
      @alerts = current_user.alerts
    end
  end
end
