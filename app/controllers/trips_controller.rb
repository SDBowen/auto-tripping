# frozen_string_literal: true

# Controller handles all Trip actions
class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update]
  before_action :filter_blank_times, only: %i[create update]

  def index
    @date = trip_search_params[:date]

    @trips = if @date.present?
               Trip.assigned_to(current_user).scheduled_on(@date.to_date)
             else
               Trip.assigned_to(current_user)
             end
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

  def trip_search_params
    params.permit(:date)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def filter_blank_times
    time_fields = %w[scheduled_pickup_time actual_pickup_time departure_time actual_dropoff_time]
    time_inputs = %w[(1i) (2i) (3i) (4i) (5i)]

    time_fields.each do |field|
      if params[:trip]["#{field}(4i)"].blank?
        time_inputs.each do |input|
          params[:trip]["#{field}#{input}"] = ''
        end
      end
    end 
  end
end
