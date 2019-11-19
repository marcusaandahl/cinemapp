class DashboardsController < ApplicationController
  def dashboard
  @my_bookings = Booking.where(user: current_user)
  end
end
