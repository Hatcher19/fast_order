class Order < ApplicationRecord
	belongs_to :user
	has_many :line_items, inverse_of: :order
	accepts_nested_attributes_for :line_items 
end
