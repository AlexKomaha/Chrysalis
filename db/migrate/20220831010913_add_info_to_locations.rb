class AddInfoToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :phone_number, :string
    add_column :locations, :url, :string
  end
end
