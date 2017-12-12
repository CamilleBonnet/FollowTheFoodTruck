Rails.application.routes.draw do


  root to: 'trucks#index'
  resources :trucks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
