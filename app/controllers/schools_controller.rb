class SchoolsController < ApplicationController
  def index
    @schools = School.pluck :name
    respond_to do |format|
      format.json { render json: @schools }
    end
  end
end
