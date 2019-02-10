# frozen_string_literal: true

require 'administrate/base_dashboard'

class TripDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    provider: Field::String,
    trip_number: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    phone_number: Field::String,
    pickup_address: Field::String,
    pickup_city: Field::String,
    pickup_zip: Field::String,
    delivery_address: Field::String,
    delivery_city: Field::String,
    appointment_date: Field::String,
    appointment_time: Field::String,
    reason_code: Field::String,
    provider_status: Field::String,
    vehicle_type: Field::String,
    trip_type: Field::String,
    additional_passengers: Field::Number,
    additional_appointments: Field::Number,
    mileage: Field::Number.with_options(decimals: 2),
    cost: Field::Number.with_options(decimals: 2),
    special_needs: Field::Text,
    instructions: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    provider
    trip_number
    first_name
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    provider
    trip_number
    first_name
    last_name
    phone_number
    pickup_address
    pickup_city
    pickup_zip
    delivery_address
    delivery_city
    appointment_date
    appointment_time
    reason_code
    provider_status
    vehicle_type
    trip_type
    additional_passengers
    additional_appointments
    mileage
    cost
    special_needs
    instructions
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    provider
    trip_number
    first_name
    last_name
    phone_number
    pickup_address
    pickup_city
    pickup_zip
    delivery_address
    delivery_city
    appointment_date
    appointment_time
    reason_code
    provider_status
    vehicle_type
    trip_type
    additional_passengers
    additional_appointments
    mileage
    cost
    special_needs
    instructions
  ].freeze

  # Overwrite this method to customize how trips are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(trip)
  #   "Trip ##{trip.id}"
  # end
end
