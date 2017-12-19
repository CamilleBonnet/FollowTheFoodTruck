Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :registrations, :controllers => {
    registrations: "registrations",
    omniauth_callbacks: "registrations/omniauth_callbacks"
  }
  post 'registrations', to: "registrations#create", as: "registration_create"

  root to: 'trucks#home'

  # routes for API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
        post  '/update_choice', to: "choices#update", as: "update_choice"
      end
    end

    resources :trucks, except: [:edit] do
      member do
        get '/PaymentStatus', to: "baskets#payment_status", as: "payment_status"
        post '/PaymentStatus', to: "baskets#payment_with_stripe", as: "payment_with_stripe"
        get '/payOrder', to: "baskets#show", as: "payorder"
      end
      resources :basket, only: [] do
        member do
          get '/PaymentStatus', to: "baskets#payment_status", as: "payment_status"
          get '/AcceptedByFoodTruck', to: "baskets#accepted_by_food_truck", as: "accepted_by_food_truck"
          get '/DeclinedByFoodTruck', to: "baskets#declined_by_food_truck", as: "declined_by_food_truck"
        end
      end

      resources :meals, only: [:create, :edit, :update]
      resources :addresses, only: [:create, :edit, :update] do
        member do
          get '/SetAddressActive', to: "addresses#set_active_address", as: "set_active_address"
        end
      end
      resources :calendars, only: [:create, :edit]
    # resources :truck_order_lists, only: [:create, :update]
    resources :choices, only: [:create, :update]
    # resources :baskets, only: [:show :update] do

      # end

    # resources :truck_order_lists, only: [:create, :update]
  end

  # routes needed for truck owner
  resources :meals, only: [:destroy]
  resources :addresses, only: [:destroy]
  resources :calendars, only: [:update, :destroy]

  # routes needed for customer
  resources :choices, only: [:destroy]
  resources :baskets, only: [:destroy]
  # resources :truck_order_lists, only: [:destroy]

  # owner can view/edit his trucks
  # get '/mytrucks', to: "trucks#index_owner", as: "all_owner_trucks"
  #not mandatory if hyp is that 1 user = 1 truck
  get '/mytruck', to: "trucks#show_owner", as: "owner_truck"
  get '/mytruck/order', to: "trucks#truck_order", as: "order_owner_truck"
  get '/mytruck/:id/edit', to: "trucks#edit", as: "edit_truck"
  # delete '/mytrucks/:id', to: "truck#destroy", as: "delete_truck"

  # routes for the user model
  get 'users/myorders', to: "users#orders_show", as: "myorders"
  get 'users/:id', to: "users#show", as: "user"
  get 'users/myprofile', to: "users#show", as: "myprofile"
  get 'users/profile/edit', to: "users#edit", as: "edit_user_profile"
  patch 'users/:id', to: "users#update", as: "user_profile"
  delete 'users', to: "users#destroy"
end
