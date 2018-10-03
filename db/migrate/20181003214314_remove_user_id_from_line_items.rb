class RemoveUserIdFromLineItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :line_items, :user_id, :integer
  end
end
