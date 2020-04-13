class Booking < ApplicationRecord 
  belongs_to :user
  belongs_to :room

  # after_create_commit :send_mail

  def send_mail
    BookingMailer.send_booking_email(self).deliver
    BookingMailer.send_booking_confirm_email(self).deliver
  end

  rails_admin do
    list do 
      field :id
      field :room_id do
        label 'Room'
        formatted_value do 
          Room.find(value).room_num
        end 
      end
      field :user_id do
        label 'Created by'
        formatted_value do 
          User.find(value).name
        end 
      end
      field :messages 
      field :profession
      field :created_at
    end

    show do 
      field :id
      field :room_id do
        label 'Room'
        formatted_value do 
          "Room #{Room.find(value).room_num} - Floor 
          #{Floor.find(Room.find(value).floor_id).floor_num} - #{Building.find(Floor.find(Room.find(value).floor_id).building_id).name}"
        end 
      end
      field :user_id do
        label 'Created by'
        formatted_value do 
          User.find(value).name
        end 
      end
      field :messages
      field :profession
      field :service_length
      field :desired_time
      field :created_at
    end
  end 
end