class ProfileController < ApplicationController
  before_action :set_profile, only: [:show]

  def root
    redirect_to profile_path(current_account.username)
  end

  private

    def set_profile
      @account = Account.friendly.find(current_account.username)
    end
end
