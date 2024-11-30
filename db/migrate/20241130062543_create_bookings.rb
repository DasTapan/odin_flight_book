class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :passenger
      t.belongs_to :flight
      t.timestamps
    end
  end
end
