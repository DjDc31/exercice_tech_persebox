class RegistrationsController < Devise::RegistrationsController


  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :nickname, :address, :date_birth, :description, :postal_code, :city, :latitude, :longitude)
  end


  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :nickname, :address, :date_birth, :description, :postal_code, :city, :latitude, :longitude)
  end


  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank? && params[:current_password].blank?
      resource.update_without_password(params.except('current_password'))
    else
      resource.update_with_password(params)
    end
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end
