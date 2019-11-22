class AddImageToCinemas < ActiveRecord::Migration[5.2]
  def change
    add_column :cinemas, :image, :string
  end
end
