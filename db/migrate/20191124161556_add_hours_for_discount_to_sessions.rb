class AddHoursForDiscountToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :hours_for_discount, :integer

  end
end
