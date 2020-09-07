class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :genre_id
      t.text :introduction
      t.string :item_image_id
      t.integer :is_active, default: '1'
      t.integer :client_id

      t.timestamps
    end
  end
end
