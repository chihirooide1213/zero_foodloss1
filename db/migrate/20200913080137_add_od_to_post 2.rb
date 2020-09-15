class AddOdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :order_details_id, :integer
  end
end
