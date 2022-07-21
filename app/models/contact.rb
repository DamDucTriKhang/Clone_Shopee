class Contact < ApplicationRecord
	belongs_to :user
	has_many :oders
  enum contact_type: { home: 0, company: 1 }
end
