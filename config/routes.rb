Rails.application.routes.draw do
  root "home#index"

  devise_for :accounts,
             sign_out_via: [:get, :delete],
             skip: [:sessions, :passwords],
             controllers: { registrations: "accounts/registrations" },
             path_names: { sign_up: "register" }
  as :account do
    # Sessions
    get "login",    to: "devise/sessions#new",     as: :new_account_session
    post "login",   to: "devise/sessions#create",  as: :account_session
    match "logout", to: "devise/sessions#destroy", as: :destroy_account_session,
                    via: Devise.mappings[:account].sign_out_via

    # Passwords
    get "account/password_reset",  to: "devise/passwords#new",    as: :new_account_password
    post "account/password_reset", to: "devise/passwords#create", as: :account_password
    patch "account/password",      to: "devise/passwords#update"
    put "account/password",        to: "devise/passwords#upate"
  end

  resources :schools, only: [:index]

  resources :majors, only: [:index]

  resources :students, only: [:index, :show, :edit, :update] do
    resources :resume_entries, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :employers, only: [:index, :show, :edit, :update]
end
