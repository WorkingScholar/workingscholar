class StudentParams
  def self.build(params)
    munged_params = params.dup
    find_or_create_school!(munged_params)
    find_or_create_major!(munged_params)
    coerce_graduation_year_to_date!(munged_params)
    munged_params
  end

  class << self
    private

      def find_or_create_school!(params)
        if params[:school_name].present?
          params[:school_id] = School.find_or_create_by(name: params[:school_name]).id
        end
        params.delete(:school_name)
      end

      def find_or_create_major!(params)
        if params[:major_name].present?
          params[:major_id] = Major.find_or_create_by(name: params[:major_name]).id
        end
        params.delete(:major_name)
      end

      def coerce_graduation_year_to_date!(params)
        if params[:graduation_year].to_i
          params[:graduation_year] = Date.new params[:graduation_year].to_i
        else
          params.delete(:graduation_year)
        end
      end
  end
end
