class ProfileController < ApplicationController
  before_action :set_profile, only: [:show]

  def root
    redirect_to profile_path(current_account)
  end

  private

    def set_profile
      @account = Account.friendly.find(params[:id])
    end
end
