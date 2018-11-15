class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :sku
      t.integer :count_in
      t.integer :count_out

      t.timestamps
    end
  end
end
