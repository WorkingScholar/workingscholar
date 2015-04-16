class MajorsController < ApplicationController
  def index
    @majors = Major.pluck :name
    respond_to do |format|
      format.json { render json: @majors }
    end
  end
end
