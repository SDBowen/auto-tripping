# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'testing@testing.com' }
    password { 'password' }
    password_confirmation { 'password' }
    first_name { 'Test' }
    last_name { 'Testing' }
  end
  factory :admin_user, class: 'User' do
    email { 'testing@testing.com' }
    password { 'password' }
    password_confirmation { 'password' }
    first_name { 'Test' }
    last_name { 'Testing' }
    role { ['admin'] }
  end
end
