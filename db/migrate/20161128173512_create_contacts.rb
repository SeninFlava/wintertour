class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :row_num
      t.string :name_en
      t.string :name_ru
      t.string :description_en
      t.string :description_ru
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
