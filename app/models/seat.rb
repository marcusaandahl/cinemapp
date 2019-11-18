class Seat < ApplicationRecord
  belongs_to :room
  # dependent?
  has_many :bookings

  validates :row, uniqueness: true, presence: true
  validates :column, uniqueness: true, presence: true
end
