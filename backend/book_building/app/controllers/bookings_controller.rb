class BookingsController < ApplicationController
  before_action :find_booking, only: [:success]
  before_action :find_room, only: [:create, :new, :preview]

  def success;end 

  def new
    @booking = Booking.new
  end

  def preview
    @booking = Booking.new(booking_params)
    if @booking.save
      render :action => 'success'
    end
  end 

  def create
    @booking = Booking.new(booking_params)
    if params[:preview_button] || !@booking.save
      render :action => 'preview'
    else
      redirect_to success_room_booking_path(id: @booking.id)
    end     
  end 

  private

  def booking_params
    params.require(:booking).permit(:messages,
                                    :profession,
                                    :service_length,
                                    :desired_time,
                                    :user_id,
                                    :room_id)
  end 

  def find_booking 
    @booking = Booking.find(params[:id])
  end 

  def find_room
    @room = Room.find(params[:room_id])
  end 
end
