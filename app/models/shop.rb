class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :vouchers
  belongs_to :user
end
