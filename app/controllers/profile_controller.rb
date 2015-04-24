class ProfileController < ApplicationController
  before_action :set_profile, only: [:show]

  private

    def set_profile
      @account = Account.friendly.find(params[:id])
    end
end
