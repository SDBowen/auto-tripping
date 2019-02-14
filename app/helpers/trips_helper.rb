# frozen_string_literal: true

module TripsHelper
  def status_label(status)
    status_span_generator status
  end

  private

  def status_span_generator(status)
    case status
    when 'entered'
      content_tag(:span, status.capitalize, class: 'badge badge-warning')
    when 'scheduled'
      content_tag(:span, status.capitalize, class: 'badge badge-primary')
    when 'complete'
      content_tag(:span, status.capitalize, class: 'badge badge-success')
    end
  end
end
