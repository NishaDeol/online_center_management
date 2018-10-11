class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :created_at, :datetime
  end
end
