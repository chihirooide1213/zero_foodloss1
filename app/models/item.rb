class Item < ApplicationRecord
	attachment :item_image
	belongs_to :client
	belongs_to :genre
	validates :name, :price,  presence: true

	has_many :cart_items
	has_many :order_details
	has_many :posts
end