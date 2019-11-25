class AddMinEmptySeatsToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :min_empty_seats, :integer
  end
end
