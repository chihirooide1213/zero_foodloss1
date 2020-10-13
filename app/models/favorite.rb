class Favorite < ApplicationRecord
	belongs_to :item
	belongs_to :customer
	validates_uniqueness_of :item_id, scope: :customer_id
end
