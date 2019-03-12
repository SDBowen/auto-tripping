# frozen_string_literal: true

class Trip < ApplicationRecord
  has_one :user
  has_one :vehicle

  enum status: { entered: 0, scheduled: 1, completed: 2, billed: 3, locked: 4 }
  validates :first_name, :last_name, :pickup_address, :pickup_city, :pickup_zip, :delivery_address, :delivery_city, presence: true
  before_save :normalize_blank_values, :set_trip_status

  scope :assigned_to, ->(user) { where(user_id: user.id) unless (user.role & %w[dispatch admin]).present? }
  scope :scheduled_on, ->(date) { where(scheduled_pickup_date: date) }
  scope :with_driver, ->(user_id) { where(user_id: user_id) }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def has_notes
    tool_tip_generator
  end

  private

  def set_trip_status
    if entered?
      scheduled! unless scheduled_pickup_time.nil? || user_id.nil? || scheduled?
    end
    if scheduled?
      completed! unless scheduled_pickup_time.nil? || user_id.nil? || actual_pickup_time.nil? || departure_time.nil? || actual_dropoff_time.nil? || completed?
    end
    if scheduled?
      entered! if (scheduled_pickup_time.nil? || user_id.nil?) && scheduled?
    end
  end

  def tool_tip_generator
    if special_needs.nil? && instructions.nil?
      nil
    elsif special_needs.nil?
      "<h5>Instructions</h5> <p>#{instructions}</p>"
    elsif instructions.nil?
      "<h5>Special Needs</h5><p>#{special_needs}</p>"
    else
      "<h5>Special Needs</h5><p>#{special_needs}</p> <br/> <h5>Instructions</h5> <p>#{instructions}</p>"
    end
  end

  def normalize_blank_values
    attributes.each do |column, _value|
      self[column].present? || self[column] = nil
    end
  end
end
