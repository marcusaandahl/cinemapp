class DashboardsController < ApplicationController
  def dashboard
    @my_orders = Order.where(user: current_user)
    @user_sessions = Session.joins(bookings: :order).where("orders.user_id = ?", current_user).order(showtime: :asc).group(:id)     #AFTER CONNECTING THE TABLES IN THE USER MODEL WITH HAS MANY STATEMENT. IS THIS LINE NECESSARY OR CAN I USE current_user.sessions?
    @active_user_sessions = @user_sessions.where("showtime > ?", DateTime.now)
    @past_user_sessions = @user_sessions.where("showtime < ?", DateTime.now)
    @cinema_sessions = Session.joins(room: :cinema).where("cinemas.name = ?", "Empire Cinema").count  #VALUABLE CODE, PAY ATTENTION TO THE SINGULARITY IN ROOM: AND :CINEMA

    # @my_bookings = Booking.joins(:session).where(user: current_user).order(showtime: :asc)
    # @active_user_sessions = @user_sessions.where("showtime > ?", DateTime.now)
    # @past_user_sessions = @user_sessions.where("showtime < ?", DateTime.now)

          # @all_sessions = Session.joins(:)
          # @active_bookings = @my_bookings.where(session:{:showtime >= DateTime.now})
          # @past_bookings = @my_bookings.where(session:{:showtime < DateTime.now})
    # @my_bookings = @my_orders.first.bookings
  end

  def active
    @user_sessions = Session.joins(bookings: :order).where("orders.user_id = ?", current_user).order(showtime: :asc).group(:id)
    @active_user_sessions = @user_sessions.where("showtime > ?", DateTime.now)
    @my_bookings = current_user.bookings.joins(:session).where("sessions.showtime > ?", DateTime.now).order(showtime: :asc).group_by(&:session)
  end

  def history
    @user_sessions = Session.joins(bookings: :order).where("orders.user_id = ?", current_user).order(showtime: :asc)
    @past_user_sessions = @user_sessions.where("showtime < ?", DateTime.now)
    @my_bookings = current_user.bookings.joins(:session).where("sessions.showtime < ?", DateTime.now).order(showtime: :desc).group_by(&:session)
  end
end


