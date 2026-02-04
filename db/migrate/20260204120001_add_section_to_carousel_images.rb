class AddSectionToCarouselImages < ActiveRecord::Migration[7.2]
  def change
    add_column :carousel_images, :section, :string, default: "main"
    add_index :carousel_images, [:page, :section, :position]
  end
end
