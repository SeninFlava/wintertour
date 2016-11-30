class AddColumnLandToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lang, :string, default: "en", presence: true
  end
end
