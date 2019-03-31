# frozen_string_literal: true

module TripsHelper
  def status_label(status)
    status_span_generator status
  end

  def build_url(trip, type)
    url = 'https://www.google.com/maps/search/?api=1&query='
    query =
      if type == 'pickup'
        "#{trip.pickup_address}, #{trip.pickup_city}, #{trip.pickup_zip}"
      else
        "#{trip.delivery_address}, #{trip.delivery_city}"
      end

    url + CGI.escape(query)
  end

  def assigned_driver(user_id)
    User.find_by_id(user_id) ? User.find_by_id(user_id).name : 'Not assigned'
  end

  private

  def status_span_generator(status)
    case status
    when 'entered'
      content_tag(:span, status.capitalize, class: 'badge badge-warning')
    when 'scheduled'
      content_tag(:span, status.capitalize, class: 'badge badge-primary')
    when 'completed'
      content_tag(:span, status.capitalize, class: 'badge badge-success')
    end
  end
end
