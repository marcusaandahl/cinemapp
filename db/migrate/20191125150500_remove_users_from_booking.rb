class RemoveUsersFromBooking < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :user, foreign_key: true
  end
end
