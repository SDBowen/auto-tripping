# Scheduler App

Key requirement: Manage trip lifecycle; import, scheduleing, and billing.

## TODO

- Customize admin dashboard property views
- Implement user role permissions

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

## Process

1. Enter a trip
2. Schedule a trip (sched. pickup time & driver)
3. Complete a trip (actual pick time, departure time, actual drop off, vehicle id, and signature type)
4. Bill a trip
5. Locked

## Stages

- Trip -> Scheduled -> Complete -> Billed -> Locked

## Trip Status

0. Entered
1. Scheduled
1. Completed
1. Billed
1. Locked
