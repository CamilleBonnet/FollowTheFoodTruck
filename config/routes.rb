Rails.application.routes.draw do
  devise_for :registrations, :controllers => {
    registrations: "registrations"#,
    # omniauth_callbacks: "registrations/omniauth_callbacks"
  }
  post 'registrations', to: "registrations#create", as: "registration_create"

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
