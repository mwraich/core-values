class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.references :card, null: false, foreign_key: true
      t.references :rating, null: false, foreign_key: true
      t.references :selection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
