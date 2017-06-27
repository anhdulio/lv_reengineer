class AddCategoryRefToContents < ActiveRecord::Migration[5.0]
  def change
    add_reference :contents, :category, foreign_key: true
  end
end
