class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_host

  def set_host
  	Rails.application.config.my_host = request.host
  	Rails.logger.info "*** Hostname = #{@hostname}"
  end


  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description])
  end

end
