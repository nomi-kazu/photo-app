class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :account, :password ]
    devise_permeter_sanitizer.permit :sign_up, keys: added_attrs
    devise_permeter_sanitizer.permit :sign_in, keys: [:email, :password]
    devise_permeter_sanitizer.permit :account_update, keys: added_attrs
  end
end
