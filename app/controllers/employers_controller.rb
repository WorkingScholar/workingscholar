class EmployersController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index]
  before_action :profile_completedness!, only: [:new, :create]

  before_action :set_employer, only: [:show, :edit, :update]

  def index
    @employers = Employer.all
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = current_account.build_employer(employer_params)
    if @employer.save
      redirect_to profile_path(current_account.username),
                  notice: "Successfully updated profile."
    else
      render :new
    end
  end

  def edit
    redirect_to @employer unless current_account.username == params[:id]
  end

  def update
    if @employer.update_attributes(employer_params)
      redirect_to profile_path(current_account.username),
                  notice: "Successfully updated profile."
    else
      render "edit"
    end
  end

  private

    def set_employer
      @employer = Account.friendly.find(params[:id]).employer
    end

    def employer_params
    end
end
