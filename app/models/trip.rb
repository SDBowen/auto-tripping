# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :user

  validates :trip_number, presence: true
end
