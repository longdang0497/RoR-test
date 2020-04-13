class Users::BookingsController < UsersApplicationController
  before_action :find_booking, only: [:show]
  
  def index
    @bookings = current_user.bookings.all
  end

  def show;end

  private

  def find_booking 
    @booking = Booking.find(params[:id])
  end 
end
