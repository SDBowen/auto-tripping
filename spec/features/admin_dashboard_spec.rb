# frozen_string_literal: true

require 'rails_helper'

describe 'Admin Dashboard:' do
  describe 'Dashboard' do
    it 'can be reached successfully' do
      visit admin_root_path
      expect(page.status_code).to eq(200)
    end

    it 'requires user to be logged in to view' do
      visit admin_root_path
      expect(current_path).to eq(new_user_session_path)
    end

    it 'requires user to have admin role' do
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)

      visit admin_root_path

      expect(current_path).to eq(new_user_session_path)
    end
  end
end
