# frozen_string_literal: true

class Trip < ApplicationRecord
  has_one :user
  has_one :vehicle

  enum status: { entered: 0, scheduled: 1, completed: 2, billed: 3, locked: 4 }
  validates :first_name, :last_name, :pickup_address, :pickup_city, :pickup_zip, :delivery_address, :delivery_city, presence: true

  scope :assigned_to, ->(user, date = 'value') { where(user_id: user.id).
  where('') unless (user.role & %w[dispatch admin]).present? }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def has_notes
    tool_tip_generator
  end

  private

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
end
