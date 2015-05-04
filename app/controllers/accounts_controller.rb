class AccountsController < ApplicationController
  def update
    @account = Account.friendly.find(params[:id])
    @account.update(account_params)
    redirect_to profile_path
  end

  def destroy
    @account = current_account
    @account.destroy
    redirect_to root_path, notice: "Your account has been deleted sucessfully."
  end

  private

  def account_params
    params.require(:account)
      .permit(:photo_url)
  end
end
