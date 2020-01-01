# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Weight Reports', type: :system do
  include Authentication

  before { log_in }

  scenario 'view list of reports' do
    visit weight_reports_path
    expect(page).to have_content 'Weight Reports'
  end

  describe 'create report' do
    before { visit new_weight_report_path }

    scenario 'successfully' do
      fill_in 'weight_report_date', with: Date.today
      fill_in 'weight_report_weight_pounds', with: 180
      click_button 'Submit'

      expect(current_path).to eql weight_reports_path
      expect(page).to have_content Date.today
    end

    scenario 'unsuccessfully' do
      fill_in 'weight_report_date', with: Date.today
      fill_in 'weight_report_weight_pounds', with: -180
      click_button 'Submit'

      expect(page).to have_content 'New Weight Report'
      expect(page).to have_content 'Validation failed: Weight pounds must be greater than 0.0'
    end
  end
end
