class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :room, foreign_key: true
      t.references :movie, foreign_key: true
      t.datetime :showtime
      t.integer :base_price

      t.timestamps
    end
  end
end
