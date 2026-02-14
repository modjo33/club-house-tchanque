class CreateCuisineImages < ActiveRecord::Migration[7.2]
  def change
    create_table :cuisine_images do |t|
      t.string :title
      t.integer :position, default: 0, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :cuisine_images, :position
    add_index :cuisine_images, :active
  end
end
