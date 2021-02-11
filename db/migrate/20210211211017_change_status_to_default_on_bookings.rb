class ChangeStatusToDefaultOnBookings < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookings, :status, 'Ordered'
  end
end
