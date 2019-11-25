require 'date'
def discounted_price(price, max_discount, seats_available, total_seats, weekend, diff_time, min_empty_seats, hours_for_discount)
  converted_discount = max_discount.fdiv(100)
  min_price = price * (1 - converted_discount)
  seats_ratio = seats_available.fdiv(total_seats)
  converted_min_seats = min_empty_seats.fdiv(100)
  if seats_ratio.negative?
    discounted_price = price
  elsif seats_ratio > converted_min_seats # If I have more than 50% of empty seats. Get lowest price
    discounted_price = min_price
  else
    discounted_price = price - ((price-min_price).fdiv(converted_min_seats)) * seats_ratio
  end
  weekend ? (discounted_price += (price - discounted_price).fdiv(5)) : discounted_price
  diff_time >= hours_for_discount ? (p "Since there is more than #{hours_for_discount} hours #{discounted_price}") : (p "Since there is less than #{hours_for_discount} hours #{(discounted_price -= (discounted_price - min_price).fdiv(5))}")
  return discounted_price
end

