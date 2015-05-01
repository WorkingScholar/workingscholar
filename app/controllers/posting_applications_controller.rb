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
end
