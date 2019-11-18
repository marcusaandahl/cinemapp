class Seat < ApplicationRecord
  belongs_to :room
  # dependent?
  has_many :bookings
end
