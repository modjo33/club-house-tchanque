class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :events, :active
    add_index :events, :start_date
  end
end
