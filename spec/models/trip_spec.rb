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

    it 'Cannot be created without a required attributes' do
      @trip.first_name = nil;
      @trip.last_name = nil;
      @trip.pickup_address = nil;
      @trip.pickup_city = nil;
      @trip.pickup_zip = nil;
      @trip.delivery_address = nil;
      @trip.delivery_city = nil;
      expect(@trip).to_not be_valid
    end

  end

  describe 'Name method:' do
    it 'Combines first and last name' do
      expect(@trip.full_name).to eq('Jon Snow')
  end
  end
end
