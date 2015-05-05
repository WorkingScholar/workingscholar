class PostingApplication < ActiveRecord::Base
  validates :student_id, uniqueness: { scope: :posting_id }

  belongs_to :posting
  delegate :title, to: :posting
  delegate :employer, to: :posting
  delegate :description, to: :posting
  delegate :duration, to: :posting
  delegate :compensation, to: :posting
  delegate :view_count, to: :posting

  belongs_to :student

  def self.recently_matched(limit)
    where(matched: true).last(limit)
  end
end
