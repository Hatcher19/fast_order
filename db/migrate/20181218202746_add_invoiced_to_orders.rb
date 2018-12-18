class AddInvoicedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :invoiced, :boolean
  end
end
