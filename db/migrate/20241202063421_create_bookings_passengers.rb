class CreateBookingsPassengers < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings_passengers, id: false do |t|
      t.belongs_to :booking
      t.belongs_to :passenger
      t.timestamps
    end
  end
end
