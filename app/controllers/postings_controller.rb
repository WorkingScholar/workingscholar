class PostingsController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index, :show]
  before_action :set_posting, only: [:edit, :update, :destroy]

  def index
    @postings = Posting.all
  end

  def new
    @posting = Posting.new
  end

  def show
  end

  def create
    @posting = Posting.new(posting_params)
    if @posting.save
      redirect_to posting_path(@posting),
                  notice: "Successfully created new posting."
    else
      render :new
    end
  end

  def edit
    @posting = Posting.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

    def set_posting
      @posting = Posting.find(params[:id])
    end

    def posting_params
      params.require(:posting)
        .permit(:title,
                :description,
                :duration,
                :compensation
               )
        .merge(employer_id: Employer.friendly.find(current_account.employer).id)
    end
end
