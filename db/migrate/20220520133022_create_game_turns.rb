class CreateGameTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :game_turns do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :room_players, array: true, default: []

      t.timestamps
    end
  end
end
