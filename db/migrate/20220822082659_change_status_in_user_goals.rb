class ChangeStatusInUserGoals < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_goals, :status, :string
    add_column :user_goals, :status, :integer, default: 0
  end
end
