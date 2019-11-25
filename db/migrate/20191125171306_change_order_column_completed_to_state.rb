class ChangeOrderColumnCompletedToState < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :completed, :state
  end
end
