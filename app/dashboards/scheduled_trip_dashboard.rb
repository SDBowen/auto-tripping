require "administrate/base_dashboard"

class ScheduledTripDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    driver: Field::BelongsTo,
    trip: Field::BelongsTo,
    id: Field::Number,
    scheduled_pickup: Field::Time,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :driver,
    :trip,
    :id,
    :scheduled_pickup,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :driver,
    :trip,
    :id,
    :scheduled_pickup,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :driver,
    :trip,
    :scheduled_pickup,
  ].freeze

  # Overwrite this method to customize how scheduled trips are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(scheduled_trip)
  #   "ScheduledTrip ##{scheduled_trip.id}"
  # end
end
