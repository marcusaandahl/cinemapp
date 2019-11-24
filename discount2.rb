require 'date'
def discounted_price(price, max_discount, seats_available, total_seats, weekend, diff_time, min_empty_seats, hours_for_discount)
  converted_discount = max_discount.fdiv(100)
  min_price = price * (1 - converted_discount)
  seats_ratio = seats_available.fdiv(total_seats)
  converted_min_seats = min_empty_seats.fdiv(100)
  # p min_price*converted_min_seats
  if seats_ratio < 0
    discounted_price = price
  elsif seats_ratio > converted_min_seats # If I have more than 50% of empty seats. Get lowest price
    discounted_price = min_price
  else
    # p discounted_price = min_price * (1 + seats_ratio)
    # discounted_price = price - ((min_price*converted_min_seats)*seats_ratio)
    discounted_price = price - ((price-min_price).fdiv(converted_min_seats))*seats_ratio
    # discounted_price = price - ((min_price*converted_min_seats)*seats_ratio)
  end

  weekend ? (discounted_price += (price - discounted_price).fdiv(5)) : discounted_price
  # p "the minimum price is #{min_price}"
  # p "the difference after considering empty seats ratio and weekend #{discounted_price - min_price}"
  (diff_time >= hours_for_discount) ? (p "Since there is more than #{hours_for_discount} hours #{discounted_price}") : (p "Since there is less than #{hours_for_discount} hours #{(discounted_price -= (discounted_price - min_price).fdiv(5))}")
  return discounted_price
end

# today = Date.today
# if today.saturday? || today.sunday? ||today.friday?
#   weekend = true
# else
#   weekend = false
# end

# Difference between the showtime and the time of purchase
diff_time = 11.98
# Fridays, Saturdays and Sundays
weekend = true
# Total number of seats
total_seats = 10
# Random number of seats available, depending on the total number of seats
# seats_available = (total_seats * (1.fdiv((rand(3..10))))).ceil
seats_available = 6
price = 160
max_discount = 40    # In percentage
min_empty_seats = 30 # In percentage
hours_for_discount = 12

p discounted_price(price, max_discount, seats_available, total_seats, weekend, diff_time, min_empty_seats, hours_for_discount)
