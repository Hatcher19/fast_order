class AddFileToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :file, :string
  end
end
