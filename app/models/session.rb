class Session < ApplicationRecord
  belongs_to :room
  belongs_to :movie
  has_many :bookings, dependent: :destroy

  validates :showtime, presence: true
  validates :base_price, presence: true

  def current_discounted_price
    datenow = DateTime.now
    time_diff = (showtime - datenow).fdiv(3600)
    today = Date.today
    if today.saturday? || today.sunday? || today.friday?
      weekend = true
    else
      weekend = false
    end
    p min_empty_seats
    p hours_for_discount
    p "Considering initial price of: #{base_price}, a max discount accepted of #{max_discount}%, with #{room.seats.where(booked:false).count} out of #{room.seats.count} available seats. Being a #{today.strftime("%A")} and #{time_diff} hours until showtime. With discount applied only #{hours_for_discount} hours before showtime and with increment in price if more than #{min_empty_seats}% seats are booked"
    discounted_price(base_price, max_discount, room.seats.where(booked:false).count, room.seats.count, weekend, time_diff, min_empty_seats, hours_for_discount)
  end

  private

  def discounted_price(price, max_discount, seats_available, total_seats, weekend, diff_time, min_empty_seats, hours_for_discount)
    converted_discount = max_discount.fdiv(100)
    min_price = price * (1 - converted_discount)
    seats_ratio = seats_available.fdiv(total_seats)
    converted_min_seats = min_empty_seats.fdiv(100)
    if seats_ratio < 0
      discounted_price = price
    elsif seats_ratio > converted_min_seats # If I have more than 50% of empty seats. Get lowest price
      discounted_price = min_price
    else
      discounted_price = price - ((price-min_price).fdiv(converted_min_seats))*seats_ratio
    end

    weekend ? (discounted_price += (price - discounted_price).fdiv(5)) : discounted_price
    (diff_time >= hours_for_discount) ? (p "Since there is more than #{hours_for_discount} hours #{discounted_price}") : (p "Since there is less than #{hours_for_discount} hours #{(discounted_price -= (discounted_price - min_price).fdiv(5))}")
    return discounted_price
  end
end
