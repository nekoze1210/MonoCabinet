class AddImageToItems < ActiveRecord::Migration[4.2]
  def change
    add_column :items, :image, :string
  end
end
