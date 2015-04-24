Rails.application.routes.draw do
  root "home#index"

  scope :profile do
    get "/:id", to: "profile#show", as: :profile
  end

  devise_for :accounts,
             sign_out_via: [:get, :delete],
             skip: [:sessions, :passwords, :registrations],
             controllers: { registrations: "accounts/registrations" }
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

    # Registrations
    get "register", to: "accounts/registrations#new", as: :new_account_registration
    post "register", to: "accounts/registrations#create", as: :account_registration
    get "profile/:id/edit", to: "accounts/registrations#edit", as: :edit_profile
    patch "profile/:id", to: "accounts/registrations#update"
    put "profile/:id", to: "accounts/registrations#update"
  end

  resources :schools, only: [:index]

  resources :majors, only: [:index]

  resources :students, only: [:index, :show, :new, :create, :update] do
    resources :resume_entries, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :employers, only: [:index, :show, :new, :create, :update]
end
