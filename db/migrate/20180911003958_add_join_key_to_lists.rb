class AddJoinKeyToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :join_key, :string
    add_index :lists, :join_key, unique: true
  end
end
