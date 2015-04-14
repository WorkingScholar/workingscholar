class ResumeEntriesController < ApplicationController
  before_action :set_resume_entry, only: [:edit, :update, :destroy]

  def new
    @resume_entry = ResumeEntry.new
  end

  # TODO: refactor
  # rubocop:disable Metrics/AbcSize
  def create
    munged_params = resume_params
    munged_params[:start_date] = Date.parse(resume_params[:start_date])
    munged_params[:end_date] = Date.parse(resume_params[:end_date])

    @resume_entry = ResumeEntry.new(munged_params)
    if @resume_entry.save
      redirect_to student_path(current_account.student),
                  notice: "Successfully created new resume entry."
    else
      render :new
    end
  end
  # rubocop:enable Metrics/AbcSize

  # TODO: refactor
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def update
    munged_params = resume_params
    if munged_params[:start_date].present?
      munged_params[:start_date] = Date.parse(resume_params[:start_date])
    end
    if munged_params[:end_date].present?
      munged_params[:end_date] = Date.parse(resume_params[:end_date])
    end

    if @resume_entry.update(munged_params)
      redirect_to student_path(current_account.student),
                  notice: "Successfully updated resume entry."
    else
      render :edit
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def destroy
    @resume_entry.destroy
    redirect_to student_path(current_account.student),
                notice: "Resume entry was successfully deleted."
  end

  private

    def set_resume_entry
      @resume_entry = ResumeEntry.find(params[:id])
    end

    def resume_params
      params.require(:resume_entry)
        .permit(:job_title,
                :employer_name,
                :start_date,
                :end_date,
                :description
               )
        .merge(student_id: Student.friendly.find(params[:student_id]).id)
    end
end
