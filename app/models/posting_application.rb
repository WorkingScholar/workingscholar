class PostingApplication < ActiveRecord::Base
  validates :student_id, uniqueness: { scope: :posting_id }

  belongs_to :posting
  belongs_to :student

  def self.recently_matched(limit)
    where(matched: true).last(limit)
  end
end
