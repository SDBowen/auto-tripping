# frozen_string_literal: true

require 'rails_helper'

describe 'Trip Workflow' do
  before do
    @admin_user = create(:admin_user)
    @dispatch_user = create(:dispatch_user)
    @driver_user = create(:driver_user)
    login_as(@dispatch_user, scope: :user)
  end

  describe 'Edit' do
    before do
      @trip_with_driver_one_assigned = create(:trip)
      @trip_with_driver_one_assigned.user_id = @driver_user.id
      @trip_with_driver_one_assigned.save
    end

    it 'has a status that can be changed by dispatch' do
      visit edit_trip_path(@trip_with_driver_one_assigned)

      choose 'trip_status_billed'
      click_on 'Save'

      expect(@trip_with_driver_one_assigned.reload.status).to eq('billed')
    end

    it 'should not be editable by driver if the status is not scheduled' do
      logout(:dispatch_user)
      login_as(@driver_user, scope: :user)

      visit edit_trip_path(@trip_with_driver_one_assigned)

      expect(page).to_not have_content eq('Scheduled')
    end

    it 'should be editable by driver if the status is scheduled' do
      @trip_with_driver_one_assigned.scheduled!
      logout(:dispatch_user)
      login_as(@driver_user, scope: :user)

      visit edit_trip_path(@trip_with_driver_one_assigned)

      choose 'trip_status_completed'
      click_on 'Save'

      expect(@trip_with_driver_one_assigned.reload.status).to eq('completed')
    end

    xit 'should not be editable by dispatch if the status is billed' do
    end

    xit 'should not be editable by dispatch if the status is locked' do
    end
  end
end
