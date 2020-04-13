class Booking < ApplicationRecord 
  belongs_to :user
  belongs_to :room

  # after_create_commit :send_mail

  def send_mail
    BookingMailer.send_booking_email(self).deliver
    BookingMailer.send_booking_confirm_email(self).deliver
  end
end