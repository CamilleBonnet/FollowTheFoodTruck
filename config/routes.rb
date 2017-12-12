Rails.application.routes.draw do

  root to: 'trucks#index'


  devise_for :registrations, :controllers => {
    registrations: "registrations"#,
    # omniauth_callbacks: "registrations/omniauth_callbacks"
  }
  post 'registrations', to: "registrations#create", as: "registration_create"

  resources :trucks

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
