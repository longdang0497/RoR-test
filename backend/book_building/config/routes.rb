Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admins/dashboard', as: 'rails_admin'
  draw :user
  draw :admin
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  match "*path" => redirect("/"), via: :all

  resources :buildings
  resources :rooms do
    resources :bookings do
      member do
        post :preview
        get :success
      end
    end 
  end
end
