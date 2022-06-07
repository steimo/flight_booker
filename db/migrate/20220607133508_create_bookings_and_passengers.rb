class CreateBookingsAndPassengers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :passengers, :bookings
  end
end
