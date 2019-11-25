class AddMaxDiscountToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :max_discount, :integer
  end
end
