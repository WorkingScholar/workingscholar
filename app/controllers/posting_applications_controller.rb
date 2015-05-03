class PostingApplicationsController < ApplicationController
  def all
    @posting_applications = PostingApplication.where(student: current_account.student)
  end

  def create
    @posting_application = current_account.student
                           .posting_applications.build(posting_id: params[:posting_id])
    if @posting_application.save
      redirect_to postings_path,
                  notice: "Submitted application successfully."
    else
      redirect_to postings_path
    end
  end

  def applicants
    @posting_applications = PostingApplication.where(posting_id: params[:posting_id])
  end

  def update
    @posting_application = PostingApplication.find(params[:id])
    @posting_application.update_attributes(posting_application_params)
    redirect_to posting_applicants_path @posting_application.posting
  end

  private
    def posting_application_params
      params.require(:posting_application)
        .permit(:matched)
    end
end
