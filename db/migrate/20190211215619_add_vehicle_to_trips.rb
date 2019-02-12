# frozen_string_literal: true

class AddReferenceToTrips < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :vehicle, foreign_key: true
  end
end
