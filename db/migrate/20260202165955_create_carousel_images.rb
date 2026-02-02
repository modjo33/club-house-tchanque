class CreateCarouselImages < ActiveRecord::Migration[7.2]
  def change
    create_table :carousel_images do |t|
      t.string :page
      t.integer :position
      t.string :alt_text

      t.timestamps
    end
  end
end
