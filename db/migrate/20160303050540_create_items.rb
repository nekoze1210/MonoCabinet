class CreateItems < ActiveRecord::Migration[4.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :maker
      t.text :image_url

      t.timestamps null: false
    end
  end
end
