CabanaClub::Application.routes.draw do

  resources :meeting_notes

  match "newMN" => "meeting_notes#newMN", :as => "newMN"

  resources :meetings


  resources :people


  resources :password_resets

  resources :contacts


  match '/about' => "users#about", :as => "about"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#home"

  resources :users
  resources :sessions
  resources :accounts

end
