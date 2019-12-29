class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

rescue_from Apartment::TenantNotFound, with: :redirect_to_root_path

  protected

  def redirect_to_root_path
    Rails.logger.error "ERROR: Apartment Tenant"
    Apartment::Tenant.reset
    redirect_to root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:subdomain, :last_name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:subdomain, :email])
  end
end
