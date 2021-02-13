class AddNameToSuits < ActiveRecord::Migration[6.0]
  def change
    add_column :suits, :name, :string
  end
end
