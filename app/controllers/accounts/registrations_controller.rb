class Accounts::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up).concat([:username, :name])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update).concat([:username, :name])
  end

  def after_update_path_for(resource)
    profile_path(resource.username)
  end
end
