Rails.application.routes.draw do

  devise_for :users
  root to: "booking_items#index"

  resources :booking_templates
  resources :booking_template_items
  resources :booking_items

  get "auto", :controller => :auto_create, :action => :index
  post "create", :controller => :auto_create, :action => :create
  post "copy", :controller => :auto_create, :action => :copy
  get "week/:week", :controller => :booking_items, :action => :week
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
