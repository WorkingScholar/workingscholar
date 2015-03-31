Rails.application.routes.draw do
  root "home#index"

  devise_for :students, path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "register"
  }
end
