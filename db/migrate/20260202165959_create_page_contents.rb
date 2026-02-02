class CreatePageContents < ActiveRecord::Migration[7.2]
  def change
    create_table :page_contents do |t|
      t.string :slug
      t.string :title
      t.text :body

      t.timestamps
    end
    add_index :page_contents, :slug, unique: true
  end
end
