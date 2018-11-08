class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.string :league
      t.string :team
      t.string :division
      t.string :shirtcolor
      t.string :inkcolor
      t.string :shirtsize
      t.integer :user_id

      t.timestamps
    end
  end
end
