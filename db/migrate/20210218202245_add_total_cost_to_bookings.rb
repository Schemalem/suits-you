class AddTotalCostToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :total_cost, :decimal, precision: 2
  end
end
