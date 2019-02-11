# frozen_string_literal: true

class CreateScheduledTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_trips do |t|
      t.time :scheduled_pickup
      t.references :trip

      t.timestamps
    end
  end
end
