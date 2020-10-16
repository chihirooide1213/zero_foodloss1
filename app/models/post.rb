class Post < ApplicationRecord
	belongs_to :item
	# TODO: yattekudasai
	belongs_to :customer
	validates :title,  presence: true
	validates :rate,  presence: true
	validates_uniqueness_of :item_id, scope: :customer_id
end
