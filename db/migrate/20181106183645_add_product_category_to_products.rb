class AddProductCategoryToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_category, :string
  end
end
