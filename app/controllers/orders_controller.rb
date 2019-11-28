class OrdersController < ApplicationController
  def new
  end

  def create
    # redirect to a cart
    if !strong_params[:seat_ids].nil?
      order = Order.create(user_id: current_user.id)
      strong_params[:seat_ids].each do |seat_id|
        booking = Booking.new(order_id: order.id, session_id: strong_params[:session_id], seat_id: seat_id)
        booking.save
      end
      order.update(price: order.price_update)

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer: current_user.stripe_customer_id,
        line_items: [{
          name: order.id,
          images: [Cloudinary::Utils.cloudinary_url(order.bookings.first.session.movie.image)],
          amount: order.price_cents,
          currency: 'dkk',
          quantity: 1
        }],
        success_url: order_url(order),
        cancel_url: order_url(order)
      )
      order.update(checkout_session_id: session.id)

      redirect_to order_path(order)
    else
      # notice when no seats selected
      redirect_to movie_session_path(Movie.find(strong_params[:movie_id]), Session.find(strong_params[:session_id]))
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    @session = Session.find(@order.bookings.first.session_id)
    @movie = Movie.find(@session.movie_id)
  end

  private

  def strong_params
    # strong params
    params.permit(:movie_id, :session_id, {:seat_ids => []})
  end
end
