# frozen_string_literal: true

# Controller handles all Trip actions
class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update]

  def index
    @trips = Trip.assigned_to(current_user)
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(permitted_attributes(Trip))

    if @trip.save
      redirect_to @trip, notice: 'Trip saved successfully'
    else
      render :new
    end
  end

  def show; end

  def edit
    authorize @trip
  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.js 
        format.html { redirect_to @trip, notice: 'Trip updated successfully' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def trip_params
    params.require(:trip).permit(policy(@trip).permitted_attributes)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
