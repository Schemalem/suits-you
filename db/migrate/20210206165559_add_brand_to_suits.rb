class AddBrandToSuits < ActiveRecord::Migration[6.0]
  def change
    add_column :suits, :brand, :string
  end
end