class AddShipVendorToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :ship_vendor, :string
  end
end
