class EmployersController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index]

  def index
    @employers = Employer.all
  end

  def show
    @employer = Employer.find(params[:id])
  end

  def edit
    @employer = Employer.find(params[:id])
  end

  def update
    @employer = Employer.find(params[:id])
    if @employer.update_attributes(employer_params)

    else
      render "edit"
    end

    redirect_to employers_path
  end

  def employer_params
    params.require(:employer).permit(:name, :username, :email)
  end
end
