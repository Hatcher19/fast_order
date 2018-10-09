class AddTrackingToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tracking, :string
  end
end
