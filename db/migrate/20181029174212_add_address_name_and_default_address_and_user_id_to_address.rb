class AddAddressNameAndDefaultAddressAndUserIdToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :address_name, :string
  end
end
