class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :bookings
  has_many :favorites, dependent: :destroy
  bind_inum :gender, Gender

  rails_admin do
    list do
      field :id
      field :name
      field :email
      field :phone
      field :created_at
    end 

    show do
      field :id
      field :name
      field :email
      field :phone
      field :gender do
        formatted_value do 
          case value
          when 0
            "Male"
          when 1
            "Female"
          end 
        end 
      end 
      field :identity
      field :created_at
    end
  end 
end
