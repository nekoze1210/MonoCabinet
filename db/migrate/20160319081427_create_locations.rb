class CreateLocations < ActiveRecord::Migration[4.2]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
