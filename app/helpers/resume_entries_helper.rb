require "partial-date"

module ResumeEntriesHelper
  def stringify_partial_date(partial_date)
    if partial_date == 0 || partial_date == -1
      partial_date
    else
      date = PartialDate::Date.load(partial_date)
      format_date date
    end
  end

  def format_date(date)
    if date.year.present? && date.month.present? && date.day.present?
      date.to_s("%B %e, %Y")
    elsif date.year.present? && date.month.present?
      date.to_s("%B %Y")
    else
      date.to_s("%Y")
    end
  end

  def resume_date_span(start_date, end_date, present)
    date_span = ""
    date_span << stringify_partial_date(start_date) if start_date > 0
    date_span << " to " if start_date != 0 && end_date != 0
    if present
      date_span << "Present"
    else
      date_span << stringify_partial_date(end_date)
    end
  end
end
