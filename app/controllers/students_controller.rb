class StudentsController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index, :show]

  before_action :set_student, only: [:show]

  def index
    @students = Student.all.includes(:account, :school, :major)
  end

  def show
  end

  private

    def set_student
      @student = Student.friendly.find(params[:id])
    end
end
