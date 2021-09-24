class CreateSelections < ActiveRecord::Migration[6.1]
  def change
    create_table :selections do |t|
      t.string :name

      t.timestamps
    end
  end
end
