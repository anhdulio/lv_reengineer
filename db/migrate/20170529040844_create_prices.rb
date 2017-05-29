class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer :price
      t.datetime :updated_date
      t.belongs_to :product, index: true

      t.timestamps null: false
    end
  end
end
