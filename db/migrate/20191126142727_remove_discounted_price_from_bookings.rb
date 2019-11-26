class RemoveDiscountedPriceFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :discounted_price, :string
  end
end
