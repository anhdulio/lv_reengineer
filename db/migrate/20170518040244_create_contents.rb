# Create Content Table
class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :type, index: true
      t.string :title
      t.string :slug, index: true
      t.json :payload
      t.integer :user_id, index: true
      t.string :author_name
      t.string :locale
      t.string :category

      t.datetime :published_at
      t.timestamps null: false
    end
  end
end
