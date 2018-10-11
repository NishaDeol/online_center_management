class AddColumnsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :description, :text
    add_column :books, :price, :float
  end
end
