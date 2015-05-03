require "partial-date"

class ResumeEntryParams
  def self.build(params)
    munged_params = params.dup
    coerce_start_to_partial_date!(munged_params)
    coerce_end_to_partial_date!(munged_params)
    munged_params
  end

  class << self
    private

      def coerce_start_to_partial_date!(params)
        start_params = params[:start_date]
        if start_params[:year].blank? && start_params[:month].blank? && start_params[:day].blank?
          params[:partial_start_date] = 0
        else
          params[:partial_start_date] = build_partial_date(start_params).value
        end
        params.delete(:start_date)
      end

      def coerce_end_to_partial_date!(params)
        end_params = params[:end_date]
        if end_params[:year].blank? && end_params[:month].blank? && end_params[:day].blank?
          params[:partial_end_date] = 0
        else
          params[:partial_end_date] = build_partial_date(end_params).value
        end
        params.delete(:end_date)
      end

      def build_partial_date(date_params)
        PartialDate::Date.new do |d|
          d.year = date_params[:year]
          d.month = date_params[:month].rjust(2, "0")
          d.day = date_params[:day].rjust(2, "0")
        end
      end
  end
end
