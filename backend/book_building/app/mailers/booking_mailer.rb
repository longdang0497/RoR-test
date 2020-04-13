class BookingMailer < ApplicationMailer
  default from: 'abc@abc.com'

  def send_booking_email(args)
    @booking = args

    mail to: @booking.host.email, subject: "Booking Product"
  end

  def send_booking_confirm_email(args)
    @booking = args

    mail to: @booking.email, subject: "Confirm Booking Product"
  end

  def self.send_reminder_expire(args)
    products = args
    
    products.each do |product|
      request_reminder_expire(product.host.email, product).deliver
    end
  end

  def request_reminder_expire(email, product)
    @product = product

    mail to: email, subject: "Reminder of expired products"
  end
end
