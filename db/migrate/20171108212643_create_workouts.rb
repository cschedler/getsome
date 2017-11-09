class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.date :wrkt_date
      t.string :title
      t.integer :movement_number

      t.timestamps
    end
  end
end
