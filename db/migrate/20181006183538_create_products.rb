class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :available
      t.datetime :discontinue_on
    end
  end
end
