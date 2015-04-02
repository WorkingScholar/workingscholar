class Students::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

    def configure_sign_up_params
      sign_up_params = [:first_name, :last_name, :username]
      devise_parameter_sanitizer.for(:sign_up) << sign_up_params
    end

    def configure_account_update_params
      update_params = [:first_name,
                       :last_name,
                       :username,
                       :school_name,
                       :major_name,
                       :graduation_year
                      ]
      devise_parameter_sanitizer.for(:account_update) << update_params
    end

    # TODO: refactor
    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def update_resource(resource, params)
      if params[:school_name].present?
        params[:school_id] = School.find_or_create_by(name: params[:school_name]).id
      end
      params.delete(:school_name)

      if params[:major_name].present?
        params[:major_id] = Major.find_or_create_by(name: params[:major_name]).id
      end
      params.delete(:major_name)

      if params[:graduation_year].to_i
        params[:graduation_year] = Date.new params[:graduation_year].to_i
      else
        params.delete(:graduation_year)
      end

      resource.update_with_password(params)
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end
