class RemoveImageUrlFromItems < ActiveRecord::Migration[4.2]
  def change
    remove_column :items, :image_url, :text
  end
end
