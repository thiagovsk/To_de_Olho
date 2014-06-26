# -*- encoding : utf-8 -*-

class ApplicationController < ActionController::Base
  alias_method :current_user, :current_usuario
  protect_from_forgery with: :exception

  helper_method :resource, :resource_name, :devise_mapping

  def after_sign_in_path_for(resource)
    home_index_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  #def current_ability
  #  @current_ability ||= Ability.new(current_usuario)
  #end

  before_filter  :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:usuario) { |u| u.permit(:avatar,:nome,:cpf,:email, :password, :password_confirmation,:login)}
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nome, :cpf, :login, :email, :password, :password_confirmation, :remember_me,:avatar) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:nome, :cpf, :login, :login, :email, :password, :remember_me,:avatar) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nome, :cpf, :login, :email, :password, :password_confirmation, :current_password,:avatar) }
  end
end
