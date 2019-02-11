# frozen_string_literal: true

FactoryBot.define do
  factory :driver do
    first_name { 'Dummy' }
    last_name { 'Driver' }
    display_name { 'Test Driver' }
    license_number { 'D11123456' }
  end
end
