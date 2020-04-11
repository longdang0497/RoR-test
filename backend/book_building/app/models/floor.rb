class Floor < ApplicationRecord
  belongs_to :admin

  has_many :rooms
end