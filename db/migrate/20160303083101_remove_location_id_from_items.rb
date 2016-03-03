class RemoveLocationIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :location_id, :integer
  end
end
