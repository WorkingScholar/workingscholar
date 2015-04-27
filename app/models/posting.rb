class Posting < ActiveRecord::Base
  belongs_to :employer
  has_many :students

  validates :employer_id, presence: true
  validates :compensation, inclusion: { in: %w(Pay Referral) }
end
