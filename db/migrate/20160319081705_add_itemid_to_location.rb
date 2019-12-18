class AddItemidToLocation < ActiveRecord::Migration[4.2]
  def change
    add_column :locations, :item_id, :integer
  end
end
