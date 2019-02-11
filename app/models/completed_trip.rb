# frozen_string_literal: true

class CompletedTrip < ApplicationRecord
  belongs_to :scheduled_trip
end
