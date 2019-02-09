# frozen_string_literal: true

require 'rails_helper'

describe 'Navigation:' do
  before do
    user = User.create(email: 'testing@testing.com', password: 'password',
                       password_confirmation: 'password', first_name: 'Sam',
                       last_name: 'Smith')
    login_as(user, scope: :user)
  end
  describe 'index' do
    before do
      visit trips_path
    end
    it 'it can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'it has a title of Trips' do
      expect(page).to have_content(/Trips page/)
    end

    it 'has a list of trips' do
      Trip.create(trip_number: 'HAHA1997444A',	first_name: 'Jon',	last_name: 'Snow',	phone_number: '2087779989',	pickup_address: '9876 S CHERRY GROVE LN',	pickup_city: 'BOISE',	pickup_zip: '87654', delivery_address: '125 N COOL ST',	delivery_city: 'MERIDIAN',	appointment_date: '20190125',	appointment_time: '900',	reason_code: '64',	trip_status: 'S1',	vehicle_type: 'C',	trip_type: 'T',	additional_passengers: 0,	additional_appointments: 0,	trip_mileage: 3.54,	trip_cost: 41.75,	special_needs: 'CALL TO CONFIRM W PICK UP TIME/CALL UPON ARRIVAL',	instructions: 'RTP T/W/R/F @930AM-12:30PM          EXP 11/30/18')

      Trip.create(trip_number: 'HAHA1997444B',	first_name: 'Jon',	last_name: 'Snow',	phone_number: '2087779989',	pickup_address: '125 N COOL ST',	pickup_city: 'MERIDIAN',	pickup_zip: '87654', delivery_address: '9876 S CHERRY GROVE LN',	delivery_city: 'BOISE',	appointment_date: '20190125',	appointment_time: '900',	reason_code: '64',	trip_status: 'S1',	vehicle_type: 'C',	trip_type: 'T',	additional_passengers: 0,	additional_appointments: 0,	trip_mileage: 3.54,	trip_cost: 41.75,	special_needs: 'CALL TO CONFIRM W PICK UP TIME/CALL UPON ARRIVAL',	instructions: 'RTP T/W/R/F @930AM-12:30PM          EXP 11/30/18')

      visit trips_path

      expect(page).to have_content(/HAHA1997444A|HAHA1997444B/)
    end
  end

  describe 'Creation:' do
    before do
      visit new_trip_path
    end
    it 'has a new page that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from the new page' do
      fill_in 'trip[trip_number]', with: '123456789'
      fill_in 'trip[first_name]', with: 'Taco'
      fill_in 'trip[last_name]', with: 'Sauce'
      fill_in 'trip[trip_cost]', with: '19.02'
      click_on 'save'

      expect(page).to have_content('Sauce')
    end
  end
end
