class AddShirtQuantityToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :shirt_quantity, :integer
  end
end
