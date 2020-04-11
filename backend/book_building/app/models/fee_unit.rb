class FeeUnit < ApplicationRecord
  belongs_to :admin

  validates :name, presence: true
  validates_uniqueness_of :name
end