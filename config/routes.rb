Rails.application.routes.draw do
  get 'inertia-example', to: 'inertia_example#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, skip: %i[sessions]
  as :user do
    get 'login', to: 'users/sessions#new', as: :new_user_session
    post 'login', to: 'users/sessions#create', as: :user_session
    match 'logout',
          to: 'users/sessions#destroy',
          as: :destroy_user_session,
          via: Devise.mappings[:user].sign_out_via
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
