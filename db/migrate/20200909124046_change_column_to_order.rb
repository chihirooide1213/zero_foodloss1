class ChangeColumnToOrder < ActiveRecord::Migration[5.2]

  	def up
    	change_column :orders, :shipping_cost, :integer, default: 800
    	change_column :orders, :status, :integer, default: 1
  	end

  # 変更前の状態
    def down
    	change_column :orders, :shipping_cost, :integer
    	change_column :orders, :status, :integer
    end
  end
