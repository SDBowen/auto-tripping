# frozen_string_literal: true

class Trip < ApplicationRecord
  validates :trip_number, presence: true

  def full_name
    return '' if first_name.nil? || last_name.nil?

    first_name.upcase + ' ' + last_name.upcase
  end
end
