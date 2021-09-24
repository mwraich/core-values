class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name, index: {unique: true}
      t.text :description

      t.timestamps
    end
  end
end
