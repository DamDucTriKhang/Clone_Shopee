class Contact < ApplicationRecord
	belongs_to :user
	has_many :oders
end
