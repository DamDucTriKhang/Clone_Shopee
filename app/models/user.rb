class User < ApplicationRecord
  has_one :cart
	has_many :contacts
  has_many :vouchers, through: :user_voucher

end
