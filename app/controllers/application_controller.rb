class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def set_locale
    session[:locale] ||= params[:locale]
    if session[:locale].present?
      I18n.locale = session[:locale].to_sym
    else
      I18n.locale = :en
    end
  end

end