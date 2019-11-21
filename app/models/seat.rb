class Seat < ApplicationRecord
  belongs_to :room
  # dependent?
  has_many :bookings

  validates :row, presence: true
  validates :column, presence: true
  # scope row + column + roomid

  def name
    "R#{row}-C#{column}"
  end
end
