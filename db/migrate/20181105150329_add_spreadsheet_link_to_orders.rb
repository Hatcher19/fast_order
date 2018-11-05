class AddSpreadsheetLinkToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :spreadsheet_link, :string
  end
end
