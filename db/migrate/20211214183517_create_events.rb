class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.string :address, null: false
      t.datetime :datetime, null: false

      t.timestamps
    end
  end
end
