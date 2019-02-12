# frozen_string_literal: true

require 'rails_helper'

describe 'Navigation:' do
  before do
    user = create(:user)
    login_as(user, scope: :user)
  end
  describe 'Index' do
    before do
      visit trips_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Trips' do
      expect(page).to have_content(/Trips page/)
    end

    it 'has a list of trips' do
      create(:trip)
      create(:second_trip)

      visit trips_path

      expect(page).to have_content(/9876 S|125 N COOL/)
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

      expect(page).to have_content('Sauce')
    end
  end

  describe 'Edit' do
    before do
      @trip = create(:trip)
      @user_id = create(:admin_user).id
      @vehicle_id = create(:vehicle).id
    end
    it 'can be reached by edit button' do
      visit trips_path

      click_link "edit_button_#{@trip.id}"
      expect(page.status_code).to eq(200)
    end

    before do
      visit edit_trip_path(@trip)
    end

    it 'can edit a specific trip' do
      fill_in 'trip[first_name]', with: 'Stu'
      fill_in 'trip[last_name]', with: 'Little'
      click_on 'Save'

      expect(page).to have_content(/Stu|Little/)
    end

    xit 'can select a driver' do
      select 'Dummy', from: 'trip_user_id'
      click_on 'Save'

      expect(page).to have_content(/user_id: #{@user_id}/)
    end

    xit 'can select a vehicle' do
      select '12', from: 'trip_vehicle_id'
      click_on 'Save'

      expect(page).to have_content(/vehicle_id: #{@vehicle_id}/)
    end

    it 'updates the allowed parameters for driver' do
      select '06', from: 'trip_scheduled_pickup_4i'
      select '05', from: 'trip_scheduled_pickup_5i'
    end
  end
end
