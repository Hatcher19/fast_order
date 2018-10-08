class AddFileToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :file, :string
  end
end
