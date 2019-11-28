Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

StripeEvent.subscribe 'checkout.session.completed' do |event|
  order = Order.find(event.data.object.display_items[0].custom.name.to_i)
  order.update(state: "completed")
  order.bookings.each do |booking|
    booking.seat.update_attribute(:booked, true)
  end
end
