class StudentsController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index, :show]

  before_action :set_student, only: [:show, :edit, :update]

  def index
    @students = Student.all.includes(:account, :school, :major, :resume_entries)
  end

  def show
  end

  def edit
    redirect_to @student unless current_account.username == params[:id]
  end

  # TODO: refactor
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def update
    munged_params = student_params.dup

    if munged_params[:school_name].present?
      munged_params[:school_id] = School.find_or_create_by(name: munged_params[:school_name]).id
    end
    munged_params.delete(:school_name)

    if munged_params[:major_name].present?
      munged_params[:major_id] = Major.find_or_create_by(name: munged_params[:major_name]).id
    end
    munged_params.delete(:major_name)

    if munged_params[:graduation_year].to_i
      munged_params[:graduation_year] = Date.new munged_params[:graduation_year].to_i
    else
      munged_params.delete(:graduation_year)
    end

    if @student.update_attributes(munged_params)
      redirect_to @student, notice: "Profile was sucessfully updated."
    else
      render :edit
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

    def set_student
      @student = Account.friendly.find(params[:id]).student
    end

    def student_params
      params.require(:student).permit(:username,
                                      :first_name,
                                      :last_name,
                                      :school_name,
                                      :major_name,
                                      :graduation_year)
    end
end
