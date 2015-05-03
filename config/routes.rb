Rails.application.routes.draw do
  authenticated :account do
    root to: "profile#root", as: :authenticated_root
  end

  get "postings/index"

  get "postings/show"

  get "postings/edit"

  get "postings/create"

  get "postings/new"

  get "postings/update"

  get "postings/destroy"

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
  resources :postings, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
    get "applicants", to: "posting_applications#applicants", as: :applicants
    resources :posting_applications, only: [:create, :destroy]
  end
  resources :posting_applications, only: [:update]
  resources :accounts, only: [:update]

  get "applications", to: "posting_applications#all", as: :applications
end
