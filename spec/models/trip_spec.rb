# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'Creation' do
    before do
      @trip = Trip.create(trip_number: 'HAHA1987654A',	first_name: 'Jon',	last_name: 'Snow',	phone_number: '2087779989',	pickup_address: '9876 S CHERRY GROVE LN',	pickup_city: 'BOISE',	pickup_zip: '87654', delivery_address: '125 N COOL ST',	delivery_city: 'MERIDIAN',	appointment_date: '20190125',	appointment_time: '900',	reason_code: '64',	trip_status: 'S1',	vehicle_type: 'C',	trip_type: 'T',	additional_passengers: 0,	additional_appointments: 0,	trip_mileage: 3.54,	trip_cost: 41.75,	special_needs: 'CALL TO CONFIRM W PICK UP TIME/CALL UPON ARRIVAL',	instructions: 'RTP T/W/R/F @930AM-12:30PM          EXP 11/30/18')
    end
    it 'Can be created' do
      expect(@trip).to be_valid
    end

    it 'Cannot be created without a trip number' do
      @trip.trip_number = nil;
      expect(@trip).to_not be_valid
    end
  end
end
