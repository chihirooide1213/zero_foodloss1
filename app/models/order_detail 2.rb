class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :item
	has_one :post
end
