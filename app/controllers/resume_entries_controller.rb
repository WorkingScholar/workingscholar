require "resume_entry_params"

class ResumeEntriesController < ApplicationController
  before_action :set_resume_entry, only: [:edit, :update, :destroy]

  def new
    @resume_entry = ResumeEntry.new
  end

  def create
    munged_params = ResumeEntryParams.build(resume_params)
    @resume_entry = current_account.student.resume_entries.build(munged_params)
    if @resume_entry.save
      redirect_to student_path(current_account.student),
                  notice: "Successfully created new resume entry."
    else
      render :new
    end
  end

  def update
    munged_params = ResumeEntryParams.build(resume_params)
    if @resume_entry.update(munged_params)
      redirect_to student_path(current_account.student),
                  notice: "Successfully updated resume entry."
    else
      render :edit
    end
  end

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
    end
end
