class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |_e|
    if user_signed_in?
      redirect_to root_path, alert: t(:access_denied)
    else
      redirect_to new_user_session_path, alert: t(:sign_in_first)
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:account_update) { |u|
    #   u.permit(:email, :password, :password_confirmation, :current_password)
    # }
    # devise_parameter_sanitizer.for(:sign_up) { |u|
    #   u.permit(:password, :password_confirmation, :email)
    # }
  end
end
