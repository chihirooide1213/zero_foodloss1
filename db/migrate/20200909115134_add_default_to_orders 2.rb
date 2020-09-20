class AddDefaultToOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :orders, :shipping_cost, default: '800'
  	change_column_default :orders, :status, default: '1'
  end
end
