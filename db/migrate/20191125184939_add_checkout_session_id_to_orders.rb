class AddCheckoutSessionIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :checkout_session_id, :string
  end
end
