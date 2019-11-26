class RemoveIntegerFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :integer, :string
  end
end
