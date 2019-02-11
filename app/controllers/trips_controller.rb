# frozen_string_literal: true

# Controller handles all Trip actions
class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update]

  def index
    @trips = Trip.last(50)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to @trip, notice: 'Trip saved successfully'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Trip updated successfully'
    else
      render :edit
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:id, :provider, :provider_status, :trip_number,
                                 :reason_code, :first_name, :last_name,
                                 :phone_number, :pickup_address, :pickup_city, :pickup_zip,
                                 :delivery_address, :delivery_city, :appointment_date,
                                 :appointment_time, :vehicle_type, :trip_type,
                                 :additional_passengers, :additional_appointments, :mileage,
                                 :cost, :scheduled_pickup, :actual_pickup_time,
                                 :departure_time, :actual_dropoff_time, :driver_id,
                                 :vehicle_id, :signature_type, :instructions)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
