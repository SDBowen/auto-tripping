# frozen_string_literal: true

require 'rails_helper'

describe 'Navigation:' do
  before do
    @driver = create(:driver_user)
    @dispatch = create(:dispatch_user)
    @vehicle = create(:vehicle)
    @trip_one = create(:trip)
    @trip_three = create(:third_trip)

    @trip_two = create(:second_trip)
    @trip_two.user_id = @driver.id
    @trip_two.save

    login_as(@dispatch, scope: :user)
  end
  describe 'Index' do
    before do
      visit trips_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a list of trips' do
      expect(page).to have_content '9876 S' && '125 N COOL'
    end

    it 'is scoped to not show trips assigned to other drivers' do
      logout(:dispatch)
      login_as(@driver, scope: :user)

      visit trips_path

      expect(page).to_not have_content '987 NOT ASSIGNED ST'
    end
    it 'is scoped to show only trips assigned to driver' do
      logout(:dispatch)
      login_as(@driver, scope: :user)

      visit trips_path

      expect(page).to have_content '125 N COOL ST'
    end
  end

  describe 'New' do
    it 'has a link on the nav bar' do
      visit root_path

      click_link 'new_trip_from_nav'
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Creation' do
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
      fill_in 'trip[cost]', with: '19.02'
      click_on 'Save'

      expect(page).to have_content 'Sauce'
    end
  end

  describe 'Edit' do
    before do
    end
    it 'can be reached by edit button' do
      visit trips_path

      click_link "edit_button_#{@trip_one.id}"
      expect(page.status_code).to eq(200)
    end

    before do
      visit edit_trip_path(@trip_one)
    end

    it 'can edit a specific trip' do
      fill_in 'trip[first_name]', with: 'Stu'
      fill_in 'trip[last_name]', with: 'Little'
      click_on 'Save'

      expect(page).to have_content 'Stu' && 'Little'
    end

    it 'can select a driver' do
      select 'DriverTest', from: 'trip_user_id'
      click_on 'Save'

      expect(page).to have_content "user_id: #{@driver.id}"
    end

    it 'can select a vehicle' do
      select '12', from: 'trip_vehicle_id'
      click_on 'Save'

      expect(page).to have_content "vehicle_id: #{@vehicle.id}"
    end

    it 'updates the allowed parameters for a driver' do
      logout(:dispatch)
      login_as(@driver, scope: :user)

      visit edit_trip_path(@trip_two)

      select '02', from: 'trip_actual_pickup_time_4i'
      select '10', from: 'trip_actual_pickup_time_5i'
      select '03', from: 'trip_departure_time_4i'
      select '15', from: 'trip_departure_time_5i'
      select '04', from: 'trip_actual_dropoff_time_4i'
      select '20', from: 'trip_actual_dropoff_time_5i'
      click_on 'Save'

      expect(page).to have_content '02:10:00' && '03:15:00' && '04:20:00'
    end

    it "doesn't allow driver to update parameters for other drivers" do
      logout(:dispatch)
      login_as(@driver, scope: :user)

      visit edit_trip_path(@trip_three)

      expect(current_path).to eq(root_path)
    end
  end
end
