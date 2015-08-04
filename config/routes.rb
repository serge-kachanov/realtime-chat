Rails.application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"

  resources :users

  root :to => "users#new"
end
