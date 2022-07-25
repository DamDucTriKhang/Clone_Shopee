class Shop < ApplicationRecord
  has_many :products
  has_many :vouchers
  belongs_to :user
end
