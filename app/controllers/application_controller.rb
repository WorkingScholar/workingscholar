class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_account!

  def after_sign_in_path_for(*)
    profile_path
  end

  def profile_completedness!
    redirect_to profile_path if current_account.student || current_account.employer
  end
end
