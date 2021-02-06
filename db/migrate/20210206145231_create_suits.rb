class CreateSuits < ActiveRecord::Migration[6.0]
  def change
    create_table :suits do |t|
      t.integer :size
      t.string :colour
      t.string :style
      t.string :occasion
      t.decimal :price, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
