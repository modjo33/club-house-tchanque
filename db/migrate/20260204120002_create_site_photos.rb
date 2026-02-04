class CreateSitePhotos < ActiveRecord::Migration[7.2]
  def change
    create_table :site_photos do |t|
      t.string :location, null: false
      t.string :alt_text
      t.integer :position, default: 0

      t.timestamps
    end
    add_index :site_photos, [:location, :position]
  end
end
