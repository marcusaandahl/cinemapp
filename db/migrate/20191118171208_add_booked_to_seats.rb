class AddBookedToSeats < ActiveRecord::Migration[5.2]
  def change
    add_column :seats, :booked, :boolean
  end
end
