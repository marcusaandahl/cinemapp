class DashboardsController < ApplicationController
  def dashboard
    @my_orders = Order.where(user: current_user)
    @user_sessions = Session.joins(:bookings).where(bookings: { user: current_user }).order(showtime: :asc).group(:id)
    @my_bookings = Booking.joins(:session).where(user: current_user).order(showtime: :asc)
    @active_user_sessions = @user_sessions.where("showtime > ?", DateTime.now)
    @past_user_sessions = @user_sessions.where("showtime < ?", DateTime.now)

          # @all_sessions = Session.joins(:)
          # @active_bookings = @my_bookings.where(session:{:showtime >= DateTime.now})
          # @past_bookings = @my_bookings.where(session:{:showtime < DateTime.now})
    # @my_bookings = @my_orders.first.bookings
  end
end


