# frozen_string_literal: true

class AddUserTimeZone < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :time_zone, :string, default: 'Central Time (US & Canada)'
  end
end
