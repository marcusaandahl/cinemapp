class AddImageToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :image, :string
  end
end
