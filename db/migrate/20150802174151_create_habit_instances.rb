class CreateHabitInstances < ActiveRecord::Migration
  def change
    create_table :habit_instances do |t|
      t.integer :habit_id, null: false
      t.integer :user_id, null: false
      t.date :date, null: false
      t.boolean :complete, null: false, default: false

      t.timestamps
    end
  end
end
