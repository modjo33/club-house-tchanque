class CreateMenuItems < ActiveRecord::Migration[7.2]
  def change
    create_table :menu_items do |t|
      t.string :category
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :position

      t.timestamps
    end
  end
end
