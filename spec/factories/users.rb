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
    email { 'testing1@testing.com' }
    password { 'password' }
    password_confirmation { 'password' }
    first_name { 'AdminTest' }
    last_name { 'Testing' }
    role { ['admin'] }
  end
  factory :dispatch_user, class: 'User' do
    email { 'testing2@testing.com' }
    password { 'password' }
    password_confirmation { 'password' }
    first_name { 'DispatchTest' }
    last_name { 'Testing' }
    role { ['dispatch'] }
  end
  factory :driver_user, class: 'User' do
    email { 'testing3@testing.com' }
    password { 'password' }
    password_confirmation { 'password' }
    display_name { 'TDriver' }
    license { 'D12345678' }
    first_name { 'DriverTest' }
    last_name { 'Testing' }
    role { ['driver'] }
  end
end
