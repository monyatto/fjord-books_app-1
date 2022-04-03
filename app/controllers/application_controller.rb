# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(*)
    books_path
  end

  def after_sign_out_path_for(*)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    permited_key = %i[email password password_confirmation remember_me postal_code address profile]
    devise_parameter_sanitizer.permit :sign_up, keys: permited_key
    devise_parameter_sanitizer.permit :account_update, keys: permited_key
  end
end
