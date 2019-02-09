# frozen_string_literal: true

# Controller handles all Trip actions
class TripsController < ApplicationController
  before_action :set_trip, only: [:show]

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
      render new
    end
  end

  def show; end

  private

  def trip_params
    params.require(:trip).permit(:trip_number, :first_name, :last_name, :trip_cost)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
