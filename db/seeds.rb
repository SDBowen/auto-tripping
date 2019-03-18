# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'user@user.com', password: 'password', password_confirmation: 'password', first_name: 'Demo', last_name: 'User')

User.create(email: 'dispatch@dispatch.com', password: 'password', password_confirmation: 'password', first_name: 'Dispatch', last_name: 'User', role: ['dispatch'])

User.create(email: 'admin@admin.com', password: 'password', password_confirmation: 'password', first_name: 'Admin', last_name: 'User', role: ['admin'])

driver1 = User.create(email: 'driver@driver.com', password: 'password', password_confirmation: 'password', first_name: 'Pat', last_name: 'Roth', role: ['driver'])

driver2 = User.create(email: 'driver2@driver.com', password: 'password', password_confirmation: 'password', first_name: 'Thomas', last_name: 'Parker', display_name: 'Tom', role: ['driver'])

delivery_addresses = ['1320 N 7th ST', '10348 W Smoke Ranch DR',
                      '2844 Chinkapin AVE', '5478 Aleut PL',
                      '5932 Kootenai LN', '21 W Boise AVE',
                      '8907 Craydon DR', '2566 N Currant PL',
                      '7033 El Caballo DR', '501 S 8th ST',
                      '3311 W State ST', 'PO Box 4833',
                      '2401 S Owyhee ST #19', '3527 Handcart LN',
                      '250 Parkcenter BLVD', '5979 S Atwell Grove',
                      '2270 Old Penitentiary RD', '6148 N Discovery WAY',
                      '9147 W Shoup AVE', '2053 N Springland PL']

delivery_zips = %w[83702 83709
                   83709 83709
                   83705 83706
                   83704 83704
                   83704 83702
                   83703 83711
                   83705 83716
                   83706 83709
                   83712 83713
                   83709 83713]

pickup_addresses = ['10348 W Smoke Ranch DR', '1320 N 7th ST',
                    '5478 Aleut PL', '2844 Chinkapin AVE',
                    '21 W Boise AVE', '5932 Kootenai LN',
                    '2566 N Currant PL', '8907 Craydon DR',
                    '501 S 8th ST', '7033 El Caballo DR',
                    'PO Box 4833', '3311 W State ST',
                    '3527 Handcart LN', '2401 S Owyhee ST #19',
                    '5979 S Atwell Grove AVE', '250 Parkcenter BLVD',
                    '6148 N Discovery WAY', '2270 Old Penitentiary RD',
                    '2053 N Springland PL', '9147 W Shoup AVE']

pickup_zips = %w[83709 83702
                 83709 83709
                 83706 83705
                 83704 83704
                 83702 83704
                 83711 83703
                 83716 83705
                 83709 83706
                 83713 83712
                 83713 83709]

trip_numbers = %w[POYU1934561A POYU1934561Z POYU1678912A POYU1678912Z POYU1234152A POYU1234152Z POYU9878526A POYU9878526Z POYU9875296A POYU9875296Z POYU9874726A POYU9874726Z POYU9879888A POYU9879888Z POYU9873409A POYU9873409Z POYU9873361A POYU9873361Z POYU1666146A POYU1666146Z]
first_names = %w[
  Mike
  Mike
  Sam
  Sam
  Ted
  Ted
  Jake
  Jake
  Carl
  Carl
  Lucy
  Lucy
  Julie
  Julie
  Maria
  Maria
  Amy
  Amy
  Anna
  Anna
]
last_names = %w[
  Smith
  Smith
  Brown
  Brown
  Jones
  Jones
  West
  West
  Sims
  Sims
  Sanchez
  Sanchez
  Parker
  Parker
  Brooks
  Brooks
  Cruze
  Cruze
  Bacon
  Bacon
]

app_times = %w[
  540
  1000
  800
  0
  900
  1500
  900
  1500
  900
  1500
  900
  1200
  900
  1500
  900
  1630
  900
  1500
  900
  1500
]

trip_type = %w[
  T
  F
  T
  F
  T
  F
  T
  F
  T
  F
  T
  F
  T
  F
  T
  F
  T
  F
  T
  F
]

trip_miles = [
  5.18,
  5.18,
  1.99,
  1.99,
  9.21,
  9.21,
  3.54,
  3.54,
  9.21,
  9.21,
  17.79,
  17.79,
  3.12,
  3.12,
  8.54,
  8.54,
  5.75,
  5.75,
  15.66,
  15.66
]

trip_costs = [
  47.54,
  47.54,
  7.97,
  7.97,
  49.63,
  49.63,
  41.75,
  41.75,
  49.63,
  49.63,
  55.37,
  55.37,
  31.36,
  31.36,
  27.62,
  27.62,
  39.25,
  39.25,
  48.98,
  48.98
]

trip_driver = [driver1, driver1, driver2, driver2, driver1, driver1, driver1, driver1, driver2]

20.times do |trip|
  Trip.create(
    trip_number: trip_numbers[trip],
    first_name: first_names[trip],
    last_name: last_names[trip],
    phone_number: '1234567890',
    pickup_address: pickup_addresses[trip],
    pickup_city: 'boise',
    pickup_zip: pickup_zips[trip],
    delivery_address: delivery_addresses[trip],
    delivery_city: 'boise',
    appointment_date: (trip.even? ? Time.zone.today : (Time.zone.today + 1.day)),
    appointment_time: app_times[trip],
    scheduled_pickup_date: (trip.even? ? Time.zone.today : (Time.zone.today + 1.day)),
    reason_code: '29',
    provider_status: 'S1',
    vehicle_type: 'P',
    trip_type: trip_type[trip],
    additional_passengers: 0,
    additional_appointments: 0,
    mileage: trip_miles[trip],
    cost: trip_costs[trip],
    special_needs: 'CALL TO CONFIRM W PICK UP TIME/CALL UPON ARRIVAL',
    instructions: 'RTP M,T W F 9AM-3:00PM    DOOR TO DOOR ASSISTANCE',
    user_id: trip_driver[trip].nil? ? nil : trip_driver[trip].id
  )
end

4.times do |vehicle|
  Vehicle.create(
    vin: '9876543211283625',
    vehicle_number: vehicle.to_s
  )
end

puts '1 User created'
puts '1 Dispatch created'
puts '1 Admin created'
puts '3 Drivers created'
puts '4 Vehicles created'
puts '20 MTM Trips have been created'
