class Post < ApplicationRecord
	belongs_to :item
	# TODO: yattekudasai
	belongs_to :customer
end
