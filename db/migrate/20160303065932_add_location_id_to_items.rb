class AddLocationIdToItems < ActiveRecord::Migration[4.2]
  def change
    add_column :items, :location_id, :integer
  end
end
