# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit trips_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Trips' do
      visit trips_path
      expect(page).to have_content(/Trips/)
    end
  end

  describe 'creation' do
    before do
      visit new_trip_path
    end
    it 'has a new trip that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from the new page' do
      fill_in 'trip[trip_number]', with: '123456789'
      fill_in 'trip[first_name]', with: 'Steven'
      fill_in 'trip[last_name]', with: 'Bowen'
      fill_in 'trip[trip_cost]', with: '12.26'
      click_on 'save'

      expect(page).to have_content('Steven')
    end
  end
end