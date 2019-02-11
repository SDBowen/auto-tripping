# frozen_string_literal: true

require 'rails_helper'

describe 'Navigation:' do
  before do
    @admin_user = create(:admin_user)
    login_as(@admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      @trip = create(:trip)
    end
  end
end
