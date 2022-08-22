class CreateEmotions < ActiveRecord::Migration[7.0]
  def change
    create_table :emotions do |t|
      t.integer :emotion_level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
