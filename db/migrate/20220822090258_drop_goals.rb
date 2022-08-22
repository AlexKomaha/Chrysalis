class DropGoals < ActiveRecord::Migration[7.0]
  def change
    remove_reference :user_goals, :goal
    drop_table :goals do |t|
      t.string :description

      t.timestamps
    end
  end
end
