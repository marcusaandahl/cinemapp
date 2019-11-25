class AddOrderToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :order, foreign_key: true
  end
end
