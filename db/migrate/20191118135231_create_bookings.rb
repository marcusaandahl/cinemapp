class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :session, foreign_key: true
      t.string :discounted_price
      t.string :integer
      t.references :seat, foreign_key: true

      t.timestamps
    end
  end
end
