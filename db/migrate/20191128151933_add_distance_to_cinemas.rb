class AddDistanceToCinemas < ActiveRecord::Migration[5.2]
  def change
    add_column :cinemas, :distance, :integer
  end
end
