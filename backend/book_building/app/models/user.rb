class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :bookings
  has_many :favorites, dependent: :destroy
  bind_inum :gender, Gender
end
