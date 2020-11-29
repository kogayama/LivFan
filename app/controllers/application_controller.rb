class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    top_user_path(current_user.id)
  end

  def after_sign_in_path_for(resource)
    top_user_path(current_user.id)
  end
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, profile_attributes: [:first_name, :last_name, :first_name_kana, :last_name_kana, :birthday]])
  end
end
