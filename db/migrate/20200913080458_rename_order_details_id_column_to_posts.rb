class RenameOrderDetailsIdColumnToPosts < ActiveRecord::Migration[5.2]
  def change
  	 rename_column :posts, :order_details_id, :order_detail_id
  end
end
