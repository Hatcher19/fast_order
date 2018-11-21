class Order < ApplicationRecord
	belongs_to :user
	belongs_to :address
	has_many :line_items, inverse_of: :order
	accepts_nested_attributes_for :line_items

	validates :spreadsheet_link, presence: true
	validates :date, presence: true 

	BIA_ENTITIES = [['Under The Lights', 'UTL'], ['Coast to Coast', 'CTC'], ['Speed LAX', 'LAX']]
end
