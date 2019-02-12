# frozen_string_literal: true

class User < ApplicationRecord
  has_many :trips
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  def name
    display_name || first_name.upcase + ' ' + last_name.upcase
  end
end
