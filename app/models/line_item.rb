class LineItem < ActiveRecord::Base
	require 'csv'

	belongs_to :order, inverse_of: :line_items

  def self.import(file, order)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      line_item = find_by(id: row["id"]) || new
      line_item.attributes = row.to_hash
      line_item.order_id = order.id
      line_item.save!
    end
  end    
end