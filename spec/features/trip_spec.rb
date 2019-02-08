# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit trips_path
      expect(page.status_code).to eq(200)
    end

    it 'Has a title of Trips' do
      visit trips_path
      expect(page).to have_content(/Trips/)
    end
  end
end
