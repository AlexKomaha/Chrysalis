class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.string :image_url
      t.string :author

      t.timestamps
    end
  end
end
