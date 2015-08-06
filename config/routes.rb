Rails.application.routes.draw do
  get 'messages/new'

  get 'sessions/new'

  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  resources :users
  resources :sessions
  resources :messages

  root :to => "users#new"
end
