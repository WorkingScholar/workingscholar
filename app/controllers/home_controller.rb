class HomeController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index]

  def index
    @recently_matched = PostingApplication.recently_matched(5)
  end
end
