class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.integer :wrkt_date
      t.string :title

      t.timestamps
    end
  end
end
