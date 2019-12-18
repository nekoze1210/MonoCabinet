class AddUrlToItems < ActiveRecord::Migration[4.2]
  def change
    add_column :items, :url, :text
  end
end
