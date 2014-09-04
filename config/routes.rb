Rails.application.routes.draw do

  root to: "posts#index"


  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :controllers => { :registrations => "registrations" }

  resources :posts
end
