class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.integer :item_id
      t.float :rate

      t.timestamps
    end
  end
end
