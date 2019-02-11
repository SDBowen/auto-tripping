# frozen_string_literal: true

class ScheduledTrip < ApplicationRecord
  belongs_to :trip
  has_one :completed_trip
end
