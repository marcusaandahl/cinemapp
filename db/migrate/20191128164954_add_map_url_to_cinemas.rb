class AddMapUrlToCinemas < ActiveRecord::Migration[5.2]
  def change
    add_column :cinemas, :map_url, :string
  end
end
