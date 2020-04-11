devise_for :users, controllers: {
  sessions: 'users/sessions',
  confirmations: 'users/confirmations',
  passwords: 'users/passwords',
  registrations: 'users/registrations',
}

devise_scope :user do
  get "/users/sign_up_success", to: "users/registrations#sign_up_success", as: :user_sign_up_success
  get "/users/resend_confirmation_success", to: "users/confirmations#resend_confirmation_success", as: :user_resend_confirmation_success
  get "/users/sending_reset_password_success", to: "users/passwords#sending_reset_password_success", as: :user_sending_reset_password_success
  get "/users/reseting_password_success", to: "users/passwords#reseting_password_success", as: :user_reseting_password_success
  get "/users/change_password_success", to: "users/confirmations#change_password_success", as: :user_change_password_success
  put "/users/confirmation", to: "users/confirmations#update", as: :user_confirm
  put '/users/favorites', to: 'users/favorites#bookmark', as: :user_favorites_product
end

namespace :users do
  resources :favorites, only: %I[index]
end
