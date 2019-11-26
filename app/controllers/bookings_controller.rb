class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @bookings = Booking.all
  end

  def create
    # redirect to a cart
    if !strong_params[:seat_ids].nil?
      order = Order.create(user_id: current_user.id)
      strong_params[:seat_ids].each do |seat_id|
        booking = Booking.new(order_id: order.id, session_id: strong_params[:session_id], discounted_price: 10, integer: 1, seat_id: seat_id)
        booking.save
      end
      redirect_to movie_session_path(Movie.find(strong_params[:movie_id]), Session.find(strong_params[:session_id]))
    else
      # notice when no seats selected
      redirect_to movie_session_path(Movie.find(strong_params[:movie_id]), Session.find(strong_params[:session_id]))
    end
  end

  def destroy
  end

  private

  def strong_params
    # strong params
    params.permit(:movie_id, :session_id, {:seat_ids => []})
  end
end
