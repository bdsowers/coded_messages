Rails.application.routes.draw do
  root "hub#index"

  post "create_message" => "hub#create_message"
  get "admin" => "hub#admin"

  post "message" => "hub#message"
  get "message" => "hub#message"
  delete "delete_message" => "hub#delete_message"

  post "site_info" => "hub#update_site_info"
  patch "site_info" => "hub#update_site_info"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
