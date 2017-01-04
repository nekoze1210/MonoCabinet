class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception , :except => ["create", "update"]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
  end

end
