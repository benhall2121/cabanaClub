CabanaClub::Application.routes.draw do

  resources :userswimlessons


  resources :swim_lessons


  resources :staticpages


  resources :member_payments


  resources :members


  resources :swim_teams


  resources :payments


  resources :meeting_notes

  match "newMN" => "meeting_notes#newMN", :as => "newMN"

  resources :meetings


  resources :people


  resources :password_resets

  resources :contacts


  match '/about' => "users#about", :as => "about"
  match '/admin' => "users#admin", :as => "admin"
  match '/payment/payments_made' => "payments#payments_made", :as => "payments_made"
  match '/add_item_to_shopping_cart' => 'users#add_item_to_shopping_cart', :via => :post
  match '/remove_item_from_shopping_cart' => 'users#remove_item_from_shopping_cart', :via => :post
  match '/remove_all_items_from_shopping_cart' => 'users#remove_all_items_from_shopping_cart', :via => :post
  match '/membership' => "users#membership", :as => "membership"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#home"

  resources :users
  resources :sessions
  resources :accounts

  get "get_accounts" => "accounts#get_accounts", :as => "get_accounts"

end
