class AddCompleteToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :completed, :boolean
  end
end
