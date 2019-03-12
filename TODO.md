# Scheduler App

Key requirement: Manage trip lifecycle; import, scheduleing, and billing.

## TODO

- Customize admin dashboard property views (enum field?)
- Add return trip on new trip entry
- Display only users with Driver role in Driver field on trip edit screen
- Refactor role check in Trip model
- Refactor to clean tests code
- Review rspec for Trip model validations
- Add gitter notifications for all db actions

## Models:

- User ->
- Vehicle ->
- Trip ->

## Features:

- Admin dashboard
- Import CSV trip detail
- Display trips by day
- Assign driver and scheduled pick up time to trip
- Assign vehicle to completed trip
- Export CSV of completed trips

## UI

- Bootstrap
- FA Icons

## Planning

### Process

1. Enter a trip
2. Schedule a trip (sched. pickup time & driver)
3. Complete a trip (actual pick time, departure time, actual drop off, vehicle id, and signature type)
4. Bill a trip
5. Locked

### Stages

- Trip -> Scheduled -> Complete -> Billed -> Locked

### Trip Status

0. Entered
1. Scheduled
1. Completed
1. Billed
1. Locked

### Key Data Fields

#### Trip (initial)

- first_name -> string, required
- last_name -> string, required
- pickup_address -> string, required
- pickup_city -> string, required
- pickup_zip -> number, required
- deliver_address -> string, required
- delivery_city -> string, required

#### Trip (final)

- scheduled_pickup -> datetime, required
- mileage -> float, required
- cost -> float, required
- actual_pickup_time -> time, required
- departure_time -> time, required
- actual_dropoff_time -> time, required

#### User

- display_name - string, required
- first_name, string, required
- last_name, string, required

#### Vehicle

- vehicle_number, string, required
