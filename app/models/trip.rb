# frozen_string_literal: true

class Trip < ApplicationRecord
  validates :trip_number, presence: true
end
