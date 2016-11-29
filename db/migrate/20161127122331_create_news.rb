class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.integer :row_num
      t.string :title_en
      t.string :title_ru
      t.string :text_en
      t.string :text_ru

      t.timestamps null: false
    end
  end
end
