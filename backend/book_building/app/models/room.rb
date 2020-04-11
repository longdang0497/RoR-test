class Room < ApplicationRecord
  belongs_to :admin
  has_many_attached :images

  has_many :floors
  validates :build_year, :city, :district, :floor_number, presence: true  
end