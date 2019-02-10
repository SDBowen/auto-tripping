# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trip, type: :model do
  before do
    @trip = create(:trip)
  end
  describe 'Creation:' do
    it 'Can be created' do
      expect(@trip).to be_valid
    end

    it 'Cannot be created without a trip number' do
      @trip.trip_number = nil;
      expect(@trip).to_not be_valid
    end
  end

  describe 'Name method:' do
    it 'Combines first and last name' do
      expect(@trip.full_name).to eq('JON SNOW')
  end
  end
end
