class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_index :users, :name
    add_column :users, :description, :string
    add_column :users, :role, :string, default: "User"
  end
end
