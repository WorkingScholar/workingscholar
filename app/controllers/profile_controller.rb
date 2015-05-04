class ProfileController < ApplicationController
  before_action :set_profile, only: [:show]

  def root
    redirect_to profile_path
  end

  private

    def set_profile
      @account = Account.find(current_account)
    end
end
