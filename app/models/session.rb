require_relative 'discount'
class Session < ApplicationRecord
  belongs_to :room
  belongs_to :movie
  has_many :bookings, dependent: :destroy

  validates :showtime, presence: true
  validates :base_price, presence: true

  def final_price
    datenow = DateTime.now
    diff = (showtime - datenow).fdiv(3600)
    today = Date.today
    if today.saturday? || today.sunday? || today.friday?
      weekend = true
    else
      weekend = false
    end
    p base_price
    p max_discount
    p room.seats.where(booked:false).count
    p room.seats.count
    p weekend
    p diff
    p min_empty_seats
    p hours_for_discount
    discounted_price(base_price, max_discount, room.seats.where(booked:false).count, room.seats.count, weekend, diff, min_empty_seats, hours_for_discount)
  end
end
