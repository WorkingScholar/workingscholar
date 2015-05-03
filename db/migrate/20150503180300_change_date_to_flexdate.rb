require "partial-date"

class ChangeDateToFlexdate < ActiveRecord::Migration
  def up
    add_column :resume_entries, :partial_start_date, :integer, default: 0
    add_column :resume_entries, :partial_end_date, :integer, default: 0
    add_column :resume_entries, :current, :boolean, default: false

    ResumeEntry.reset_column_information

    ResumeEntry.all.each do |entry|
      start_date = entry.start_date
      end_date = entry.end_date
      partial_start = PartialDate::Date.new do |d|
        d.year = start_date.year.to_s
        d.month = start_date.month.to_s.rjust(2, "0")
        d.day = start_date.day.to_s.rjust(2, "0")
      end
      partial_end = PartialDate::Date.new do |d|
        d.year = end_date.year.to_s
        d.month = end_date.month.to_s.rjust(2, "0")
        d.day = end_date.day.to_s.rjust(2, "0")
      end
      entry.update_attributes partial_start_date: partial_start.value, partial_end_date: partial_end.value
      entry.save
    end

    remove_column :resume_entries, :start_date
    remove_column :resume_entries, :end_date
  end

  def down
    add_column :resume_entries, :start_date, :date
    add_column :resume_entries, :end_date, :date

    ResumeEntry.reset_column_information

    ResumeEntry.all.each do |entry|
      partial_start_date = PartialDate::Date.load entry.partial_start_date
      partial_end_date = PartialDate::Date.load entry.partial_end_date
      start_date = Date.parse(partial_start_date.to_s(:long))
      end_date = Date.parse(partial_end_date.to_s(:long))
      entry.update_attributes start_date: start_date, end_date: end_date
      entry.save
    end

    remove_column :resume_entries, :partial_start_date
    remove_column :resume_entries, :partial_end_date
    remove_column :resume_entries, :current
  end
end
