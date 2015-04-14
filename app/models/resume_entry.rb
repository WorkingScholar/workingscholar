class ResumeEntry < ActiveRecord::Base
  validates :job_title, presence: true
  validates :employer_name, presence: true
  validates :description, presence: true

  belongs_to :student

  belongs_to :employer
end
