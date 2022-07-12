class Order < ApplicationRecord
	belongs_to :contact
	has_many :logistics
	has_many :vouchers
	has_many :line_items, as: :itemable

end
