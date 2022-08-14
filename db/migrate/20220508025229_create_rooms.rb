class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.boolean :is_active, :default => false
      t.string :category
      t.string :game_mode
      t.integer :timer_interval

      t.timestamps
    end
  end
end
