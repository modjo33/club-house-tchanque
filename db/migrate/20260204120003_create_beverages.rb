class CreateBeverages < ActiveRecord::Migration[7.2]
  def change
    create_table :beverages do |t|
      t.string :category, null: false
      t.string :name, null: false
      t.text :description
      t.decimal :price_small, precision: 8, scale: 2
      t.decimal :price_medium, precision: 8, scale: 2
      t.decimal :price_large, precision: 8, scale: 2
      t.decimal :price, precision: 8, scale: 2
      t.integer :position, default: 0
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :beverages, :category
    add_index :beverages, [:category, :position]
  end
end
