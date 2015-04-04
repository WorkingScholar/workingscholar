Rails.application.routes.draw do
  root "home#index"

  devise_for :students,
             sign_out_via: [:get, :delete],
             path_names: {
               sign_in: "login",
               sign_out: "logout",
               sign_up: "register"
             },
             controllers: {
               registrations: "students/registrations"
             }
  resources :students, only: [:index]

  resources :schools, only: [:index]

  resources :majors, only: [:index]
end
