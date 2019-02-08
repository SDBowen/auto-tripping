# frozen_string_literal: true

class ScheduledTrip < ApplicationRecord
  belongs_to :driver
  belongs_to :trip
end
