class Posting < ActiveRecord::Base
  belongs_to :employer
  has_many :posting_applications

  validates :employer_id, presence: true
  validates :compensation, inclusion: { in: %w(Pay Referral) }

  # def available?
  #   if Application.find_by(posting_id: self.id, student_id: current_account.student.id)
  #     # one exists
  #   else
  #     # does not exist
  #   end
  # end
end
