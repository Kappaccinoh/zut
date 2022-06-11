class CreateBlackAndWhiteAnimalsCategoryAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :black_and_white_animals_category_answers do |t|
      t.references :room, null: false, foreign_key: true
      t.text :answer
      t.boolean :been_said, :default => false

      t.timestamps
    end
  end
end
