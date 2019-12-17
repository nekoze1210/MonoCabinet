class AddAddressToLocations < ActiveRecord::Migration[4.2]
  def change
    add_column :locations, :address, :string
  end
end
