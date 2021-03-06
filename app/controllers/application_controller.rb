class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nickname
    devise_parameter_sanitizer.for(:sign_up) << :first_station
    devise_parameter_sanitizer.for(:sign_up) << :second_station
    devise_parameter_sanitizer.for(:sign_up) << :user_interet
    devise_parameter_sanitizer.for(:sign_up) << :introduce
    devise_parameter_sanitizer.for(:sign_up) << :major

  end
  
end
