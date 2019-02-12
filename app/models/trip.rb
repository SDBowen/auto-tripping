# frozen_string_literal: true

class Trip < ApplicationRecord
  has_one :user
  has_one :vehicle

  enum status: { entered: 0, scheduled: 1, completed: 2, billed: 3, locked: 4 }
  validates :trip_number, presence: true

  def full_name
    return '' if first_name.nil? || last_name.nil?

    first_name.upcase + ' ' + last_name.upcase
  end
end
