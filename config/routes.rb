Rails.application.routes.draw do
  resources :booking_templates
  resources :booking_template_items
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
