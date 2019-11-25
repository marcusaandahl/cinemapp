class DashboardsController < ApplicationController
  def dashboard
    @my_orders = Order.where(user: current_user)
    @my_bookings = @my_orders.first.bookings
  end
end
