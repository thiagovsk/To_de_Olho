# -*- encoding : utf-8 -*-

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :resource, :resource_name, :devise_mapping

  def after_sign_in_path_for(resource)
    home_index_path
  end



  before_filter :require_login, :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nome, :cpf, :login, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:nome, :cpf, :login, :login, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nome, :cpf, :login, :email, :password, :password_confirmation, :current_password) }
  end
end

  private

  def require_login
    unless @current_user
    redirect_to root_path
  end
end