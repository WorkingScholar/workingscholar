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
end
