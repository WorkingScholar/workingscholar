class EmployersController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index]

  before_action :set_employer, only: [:show, :edit, :update]

  def index
    @employers = Employer.all
  end

  def show
  end

  def edit
  end

  def update
    if @employer.update_attributes(employer_params)
      redirect_to employers_path, notice: "Succesfully updated your profile"
    else
      render "edit"
    end
  end

  private

  def set_employer
    @employer = Account.friendly.find(params[:id]).employer
  end

  def employer_params
    params.require(:employer).permit(:name, :username, :email)
  end
end
