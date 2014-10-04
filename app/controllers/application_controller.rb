class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :role, :fname, :lname, :company_id)
    end
  end

  def current_user
    return @_current_user if @_current_user

    token = request.headers["HTTP_AUTH_TOKEN"]
    key = ApiKey.where(token: token).first!
    @_current_user = key.user
  end
end
