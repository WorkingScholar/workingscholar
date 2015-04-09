class StudentsController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index, :show]

  before_action :set_student, only: [:show]

  def index
    @students = Student.all.includes(:account, :school, :major)
  end

  def show
    @student = Student.find_by(username: params[:id])
  end

  private

    def set_student
      @student = Student.find_by(username: params[:id])
    end
end
