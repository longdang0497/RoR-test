class Users::BookingsController < UsersApplicationController
  def index
    @bookings = current_user.bookings.all
  end
end
