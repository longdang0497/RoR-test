devise_for :users, controllers: {
  sessions: 'users/sessions',
  confirmations: 'users/confirmations',
  passwords: 'users/passwords',
  registrations: 'users/registrations',
}

devise_scope :user do
  get "/users/sign_up_success", to: "users/registrations#sign_up_success", as: :user_sign_up_success
  get "/users/resend_confirmation_success", to: "users/confirmations#resend_confirmation_success", as: :user_resend_confirmation_success
  get '/users/sign_out' => 'users/sessions#destroy'
  get "/users/sending_reset_password_success", to: "users/passwords#sending_reset_password_success", as: :user_sending_reset_password_success
  get "/users/reseting_password_success", to: "users/passwords#reseting_password_success", as: :user_reseting_password_success
  get "/users/change_password_success", to: "users/confirmations#change_password_success", as: :user_change_password_success
  put "/users/confirmation", to: "users/confirmations#update", as: :user_confirm
  put '/users/favorites/:id', to: 'users/favorites#bookmark', as: :user_favorites_building
  get '/users/profile', to: 'users/profile#index', as: :user_profile 
  get '/users/profile/edit', to: 'users/profile#edit', as: :user_edit_profile
  put '/users/profile/edit', to: 'users/profile#update', as: :user_update_profile
end

namespace :users do
  get '/', to: 'dashboard#index', as: :dashboard
  resources :favorites, only: %I[index]
  resources :bookings, only: [:index, :show]
end
