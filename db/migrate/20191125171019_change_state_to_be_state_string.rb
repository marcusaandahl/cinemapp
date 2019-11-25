class ChangeStateToBeStateString < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :completed, :string
  end
end
