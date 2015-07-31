class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :title, null: false
      t.text :description
      t.string :frequency, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
