class CreateWineItems < ActiveRecord::Migration[7.2]
  def change
    create_table :wine_items do |t|
      t.string :category
      t.string :name
      t.string :appellation
      t.decimal :glass_price
      t.decimal :bottle_price
      t.integer :position

      t.timestamps
    end
  end
end
