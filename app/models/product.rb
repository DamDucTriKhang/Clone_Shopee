class Product < ApplicationRecord
	belongs_to :shop
	has_many :stocks
	has_many :line_items
	has_one_attached :image
	default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }, :format => { :with => /\d/ }
end
