# frozen_string_literal: true

class AddStatusToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :status, :integer, default: 0
  end
end
