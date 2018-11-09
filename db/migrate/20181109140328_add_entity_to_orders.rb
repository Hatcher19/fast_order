class AddEntityToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :entity, :string
  end
end
