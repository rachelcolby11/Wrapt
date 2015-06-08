class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

   protected

  def after_sign_in_path_for(resource)   
    welcome_dashboard_path(resource)
  end
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
