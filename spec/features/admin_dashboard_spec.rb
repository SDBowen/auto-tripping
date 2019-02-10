# frozen_string_literal: true

require 'rails_helper'

describe 'Admin Dashboard:' do
  describe 'Dashboard' do
    it 'requires user to be logged in to view' do
      visit admin_root_path
      expect(current_path).to eq(new_user_session_path)
    end

    it 'can not be accessed by users without admin role' do
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)

      visit admin_root_path

      expect(current_path).to eq(root_path)
    end

    it 'can be accessed by users with admin role' do
      admin_user = FactoryBot.create(:admin_user)

      login_as(admin_user, scope: :user)

      visit admin_root_path

      expect(current_path).to eq(admin_root_path)
    end
  end
end
