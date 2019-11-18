class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.integer :row
      t.integer :column
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
