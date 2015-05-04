class Posting < ActiveRecord::Base
  belongs_to :employer
  has_many :posting_applications

  validates :employer_id, presence: true
  validates :compensation, inclusion: { in: %w(Pay Referral) }

  def self.posted_by(employer)
    where(employer_id: employer)
  end

  def applied?(student)
    PostingApplication.where(student: student, posting: self).length > 0
  end
end
