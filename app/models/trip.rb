# frozen_string_literal: true

class Trip < ApplicationRecord
  validates :trip_number, presence: true

  def full_name
    first_name.upcase + ' ' + last_name.upcase
  end
end
