class Session < ApplicationRecord
  belongs_to :room
  belongs_to :movie
  has_many :bookings, dependent: :destroy
end
