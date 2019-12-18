class RemoveLocationIdFromItems < ActiveRecord::Migration[4.2]
  def change
    remove_column :items, :location_id, :integer
  end
end
