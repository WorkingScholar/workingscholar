class PostingApplicationsController < ApplicationController
  def create
    @posting_application = current_account.student
      .posting_applications.build(posting_id: params[:posting_id])
    if @posting_application.save
      redirect_to profile_path(current_account.username),
                  notice: "Successfully submitted resume."
    else
      redirect_to postings_index_path
    end
  end

  def update
  end

  def destroy
  end
end
