class Product < ApplicationRecord
	belongs_to :shop
	has_many :stocks
	has_many :line_items
	has_one_attached :image
end
