class Posting < ActiveRecord::Base
  belongs_to :employer

  validates :employer_id, presence: true
end
