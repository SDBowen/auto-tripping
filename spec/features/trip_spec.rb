# frozen_string_literal: true

require 'rails_helper'

describe 'Navigation:' do
  before do
    user = create(:user)
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
      trip1 = create(:trip)
      trip2 = create(:second_trip)

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
