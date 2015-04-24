require "student_params"

class StudentsController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index, :show]
  before_action :profile_completedness!, only: [:new, :create]

  before_action :set_student, only: [:show, :edit, :update]

  def index
    @students = Student.all.includes(:account, :school, :major, :resume_entries)
  end

  def new
    @student = Student.new
  end

  def create
    munged_params = StudentParams.build(student_params)
    @student = current_account.build_student(munged_params)
    if @student.save && current_account.save
      redirect_to profile_path(current_account.username),
                  notice: "Successfully updated profile."
    else
      render :new
    end
  end

  def edit
    redirect_to @student unless current_account.username == params[:id]
  end

  def update
    munged_params = StudentParams.build(student_params)
    if @student.update_attributes(munged_params)
      redirect_to @student, notice: "Profile was sucessfully updated."
    else
      render :edit
    end
  end

  private

    def set_student
      @student = Account.friendly.find(params[:id]).student
    end

    def student_params
      params.require(:student)
        .permit(:name,
                :school_name,
                :major_name,
                :graduation_year
               )
    end
end
