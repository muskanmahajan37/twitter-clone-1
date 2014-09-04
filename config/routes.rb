Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :controllers => { :registrations => "users/registrations" }
end
