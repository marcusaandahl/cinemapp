class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :discounted_price

      t.timestamps
    end
  end
end
