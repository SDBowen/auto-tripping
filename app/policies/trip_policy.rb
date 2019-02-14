# frozen_string_literal: true

class TripPolicy < ApplicationPolicy
  def new?
    dispatch?
  end

  def update?
    dispatch? || trip_assigned_to_driver && trip_scheduled?
  end

  def permitted_attributes
    if dispatch?
      %i[id status provider provider_status trip_number
         reason_code first_name last_name
         phone_number pickup_address pickup_city pickup_zip
         delivery_address delivery_city appointment_date
         appointment_time vehicle_type trip_type
         additional_passengers additional_appointments mileage
         cost scheduled_pickup actual_pickup_time
         departure_time actual_dropoff_time user_id
         vehicle_id signature_type instructions]
    elsif (user.role & driver_types).present?
      %i[status actual_pickup_time departure_time actual_dropoff_time]
    end
  end

  private

  def trip_assigned_to_driver
    record.user_id == user.id
  end

  def dispatch?
    (user.role & dispatch_types).present?
  end

  def trip_scheduled?
    record.scheduled?
  end
end
