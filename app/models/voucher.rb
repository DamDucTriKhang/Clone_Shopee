class Voucher < ApplicationRecord
	belongs_to :order
	has_many :users, through: :user_voucher
	has_many :line_items, as: :itemable

end
