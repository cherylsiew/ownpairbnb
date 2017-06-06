Rails.application.routes.draw do
  

  root 'welcome#index'


  #----clearance routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  resources :users, only: [:edit]
  resources :users, only: [:update]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #--clearance routes end here

  resources :listings
  resources :listings do
    resources :bookings, only: [:new, :create, :show]
  end

  
  resources :users do
    resources :bookings, only: [:index], as: "bookings"
  end

  resources :users do
    resources :listings, only: [:index], as: "listings"
  end

  resources :bookings, only: [:destroy]

    # resources :braintree, only: [:new, :create, :show]
  get '/bookings/:id/braintree/new' => "braintree#new", as: "braintree"
  post 'braintree/checkout'



end
