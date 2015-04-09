class EmployersController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index, :show]

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
  end
end
