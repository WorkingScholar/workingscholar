class ResumeEntryParams
  def self.build(params)
    munged_params = params.dup
    coerce_start_to_date!(munged_params)
    coerce_end_to_date!(munged_params)
    munged_params
  end

  class << self
    private

      def coerce_start_to_date!(params)
        params[:start_date] = Date.parse(params[:start_date]) if params[:start_date].present?
      end

      def coerce_end_to_date!(params)
        params[:end_date] = Date.parse(params[:end_date]) if params[:end_date].present?
      end
  end
end
