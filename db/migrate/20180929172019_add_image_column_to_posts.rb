class AddImageColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :text
    add_column :posts, :image, :string
  end
end
