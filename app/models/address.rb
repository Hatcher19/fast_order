class Address < ApplicationRecord
	belongs_to :user
	has_many :orders

	validates :address_name, presence: true
	validates :contact_name, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zipcode, presence: true

end
