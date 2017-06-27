class RemoveCategoryFromContents < ActiveRecord::Migration[5.0]
  def change
    remove_column :contents, :category, :string
  end
end
