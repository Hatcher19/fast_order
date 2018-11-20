class AddShipCostToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :ship_cost, :string
  end
end
