# frozen_string_literal: true

class CreateCompletedTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_trips do |t|
      t.time :actual_pickup_time
      t.time :departure_time
      t.time :actual_dropoff_time
      t.string :signature_type
      t.references :scheduledtrip

      t.timestamps
    end
  end
end
