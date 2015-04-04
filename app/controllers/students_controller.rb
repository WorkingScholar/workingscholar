class StudentsController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index]

  def index
    @students = Student.all.includes(:account, :school, :major)
  end
end
