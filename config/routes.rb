Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :registrations, :controllers => {
    registrations: "registrations"#,
    # omniauth_callbacks: "registrations/omniauth_callbacks"
  }
  post 'registrations', to: "registrations#create", as: "registration_create"

  root to: 'trucks#home'

  resources :trucks, except: [:edit] do
    resources :meals, only: [:create, :update]
    # resources :addresses, only: [:create, :update]
    # resources :calendars, only: [:create, :update]
    # resources :truck_order_lists, only: [:create, :update]
    resources :choices, only: [:create, :update]
    resources :baskets, only: [:create, :update]
    resources :truck_order_lists, only: [:create, :update]
  end

  # routes needed for truck owner
  resources :meals, only: [:destroy]

  # routes needed for customer
  resources :choices, only: [:destroy]
  resources :baskets, only: [:destroy]
  resources :truck_order_lists, only: [:destroy]


  # owner can view/edit his trucks
  # get '/mytrucks', to: "trucks#index_owner", as: "all_owner_trucks"
  #not mandatory if hyp is that 1 user = 1 truck
  get '/mytruck', to: "trucks#show_owner", as: "owner_truck"
  get '/mytruck/:id/edit', to: "truck#edit", as: "edit_truck"
  # delete '/mytrucks/:id', to: "truck#destroy", as: "delete_truck"



  # future orders routes ?
  # get '/mytrucks/accept/:id', to: "orders#accept", as: "accept_order"
  # get '/mytrucks/decline/:id', to: "orders#decline", as: "decline_order"
  # get '/mytrucks/cancel/:id', to: "orders#cancel", as: "cancel_order"

  # routes for the user model ?
  # get 'users/:id', to: "users#show", as: "user"
  # get 'users/myprofile', to: "users#show", as: "myprofile"
  # get 'users/profile/edit', to: "users#edit", as: "edit_user_profile"
  # patch 'users/:id', to: "users#update", as: "user_profile"
  # delete 'users', to: "users#destroy"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
