class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.integer :list_id
      t.integer :item_id
      t.string :quantity
      t.boolean :need, default: true

      t.timestamps
    end
  end
end
