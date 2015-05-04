class AccountsController < ApplicationController
  def update
    @account = Account.friendly.find(params[:id])
    @account.update(account_params)
    redirect_to profile_path
  end

  def account_params
    params.require(:account)
      .permit(:photo_url)
  end
end
