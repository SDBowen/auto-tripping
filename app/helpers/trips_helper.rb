# frozen_string_literal: true

module TripsHelper
  def status_label(status)
    status_span_generator status
  end

  def build_url(trip, type)
    if type == 'pickup'
      url = 'https://www.google.com/maps/search/?api=1&query='
      query = "#{trip.pickup_address}, #{trip.pickup_city}, #{trip.pickup_zip}"
      url + CGI.escape(query)
    else
      url = 'https://www.google.com/maps/search/?api=1&query='
      query = "#{trip.delivery_address}, #{trip.delivery_city}"
      url + CGI.escape(query)
    end
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
