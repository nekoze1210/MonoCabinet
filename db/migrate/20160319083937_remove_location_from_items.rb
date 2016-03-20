class RemoveLocationFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :latitude, :float
    remove_column :items, :longitude, :float
    remove_column :items, :address, :string
  end
end
