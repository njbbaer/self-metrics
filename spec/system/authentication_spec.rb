# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication', type: :system do
  include Authentication

  context 'logged out' do
    scenario 'redirect to login page' do
      visit root_path
      expect(current_path).to eql '/login'
    end

    describe 'log in' do
      scenario 'successfully' do
        visit login_path
        fill_in 'Password', with: Rails.configuration.password
        click_button 'Authenticate'
        expect(page).to have_content 'You have authenticated successfully'
      end

      scenario 'unsuccessfully' do
        visit login_path
        fill_in 'Password', with: 'invalid_password'
        click_button 'Authenticate'
        expect(current_path).to eql '/login'
        expect(page).to have_content 'Authentication failed'
      end
    end
  end

  context 'logged in' do
    before { log_in }

    scenario 'log out' do
      visit root_path
      click_link 'Log Out'
      expect(page).to have_content 'You have been logged out'
    end
  end
end
