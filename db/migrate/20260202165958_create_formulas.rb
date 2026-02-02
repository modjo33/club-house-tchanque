class CreateFormulas < ActiveRecord::Migration[7.2]
  def change
    create_table :formulas do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :position

      t.timestamps
    end
  end
end
