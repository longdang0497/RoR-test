devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  confirmations: 'admins/confirmations',
  registrations: 'admins/registrations'
}

devise_scope :admin do
  put "/admins/confirmation", to: "admins/confirmations#update", as: :admin_confirm
  get "/admins/sign_up_success", to: "admins/registrations#sign_up_success", as: :admin_sign_up_success
  get "/admins/change_password_success", to: "admins/confirmations#change_password_success", as: :admin_change_password_success
  get "/admins/resend_confirmation_success", to: "admins/confirmations#resend_confirmation_success", as: :admin_resend_confirmation_success
  get "/admins/reset_password_complete", to: "admins/passwords#reset_password_complete", as: :admin_reset_password_complete
  get "/admins/update_password_complete", to: "admins/passwords#update_password_complete", as: :admin_update_password_complete
end

namespace :admins do
end