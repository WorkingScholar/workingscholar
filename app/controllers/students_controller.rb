class StudentsController < ApplicationController
  def index
    @students = Student.all.includes(:school, :major)
  end
end
