class CreateFamousFoursomesCategoryAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :famous_foursomes_category_answers do |t|
      t.references :room, null: true, foreign_key: true # Note that we allow null: true
      t.text :answer
      t.boolean :been_said, :default => false

      t.timestamps
    end
  end
end
