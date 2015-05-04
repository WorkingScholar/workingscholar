require "partial-date"

class ResumeEntry < ActiveRecord::Base
  validates :student, presence: true
  validates :job_title, presence: true
  validates :employer_name, presence: true
  validates :description, presence: true

  belongs_to :student

  belongs_to :employer

  def loaded_partial_date(date)
    if date == -1
      0
    else
      PartialDate::Date.load date
    end
  end

  def loaded_partial_start_date
    loaded_partial_date partial_start_date
  end

  def loaded_partial_end_date
    loaded_partial_date partial_end_date
  end
end
