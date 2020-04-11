class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable
  
  has_many :buildings, dependent: :destroy
  has_many :floors, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :fee_units, dependent: :destroy
end
