class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :company_name, :rfc])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :company_name, :rfc])
  end

  protected

  def after_sign_in_path_for(_resource)
    branches_path
  end
end
