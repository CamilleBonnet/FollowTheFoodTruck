Rails.application.routes.draw do

  devise_for :registrations, :controllers => {
    registrations: "registrations"#,
    # omniauth_callbacks: "registrations/omniauth_callbacks"
  }
  post 'registrations', to: "registrations#create", as: "registration_create"

  root to: 'trucks#home'

  resources :trucks do
    resources :meals, only: [:new, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
