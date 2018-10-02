class LineItem < ApplicationRecord
	belongs_to :order, inverse_of: :line_items
end
