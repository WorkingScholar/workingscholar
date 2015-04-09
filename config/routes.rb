Rails.application.routes.draw do
  root "home#index"

  devise_for :accounts,
             sign_out_via: [:get, :delete],
             skip: [:sessions, :passwords],
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

  resources :students, only: [:index, :show, :edit, :update]

  resources :employers, only: [:index, :show, :edit, :update]
end
