class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.string :movement
      t.integer :set
      t.integer :rep
      t.integer :weight
      t.string :duration
			t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
