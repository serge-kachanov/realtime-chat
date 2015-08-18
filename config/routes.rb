Rails.application.routes.draw do
  get 'messages/websockets' => 'messages#new_websockets'
  get 'messages/shortpoll' => 'messages#new_shortpoll'

  get 'home' => 'home#index'

  get 'sessions/new'

  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  resources :users
  resources :sessions
  resources :messages
  resources :home

  root :to => "home#index"
end
