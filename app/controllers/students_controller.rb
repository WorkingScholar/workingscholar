class StudentsController < ApplicationController
  def index
    @students = Student.all.includes(:school, :major)
  end

  def show
    @student = Student.find_by(username: params[:id])
  end
end
