class Voucher < ApplicationRecord
	belongs_to :order
	belongs_to :shop
	has_many :users, through: :user_voucher
	has_many :line_items, as: :itemable

end
