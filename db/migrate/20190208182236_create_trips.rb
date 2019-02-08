class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :trip_numer
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :pickup_address
      t.string :pickup_city
      t.string :pickup_zip
      t.string :delivery_address
      t.string :delivery_city
      t.datetime :appointment_date
      t.time :appointment_time
      t.string :reason_code
      t.string :trip_status
      t.string :vehicle_type
      t.string :trip_type
      t.integer :additional_passengers
      t.integer :additional_appointments
      t.integer :trip_mileage
      t.float :trip_cost
      t.text :special_needs
      t.text :instructions

      t.timestamps
    end
  end
end
