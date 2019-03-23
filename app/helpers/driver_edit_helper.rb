# frozen_string_literal: true

module DriverEditHelper
  def next_time_needed(trip)
    return :actual_pickup_time if trip.actual_pickup_time.blank?
    return :departure_time if trip.departure_time.blank?
    return :actual_dropoff_time if trip.actual_dropoff_time.blank?
    return :signature
  end
end
