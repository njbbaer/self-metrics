# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Weight Reports', type: :system do
  include Authentication

  before { log_in }

  describe 'Weight reports index' do
    before { visit weight_reports_path }

    scenario 'view weight reports index page' do
      expect(page).to have_content 'Weight Reports'
    end
  end

  describe 'create weight report' do
    before { visit new_weight_report_path }

    scenario 'view new weight report page' do
      expect(page).to have_content 'New Weight Report'
    end

    scenario 'create valid weight report' do
      fill_in 'weight_report_date', with: Date.today
      fill_in 'weight_report_weight_pounds', with: 180
      click_button 'Submit'

      expect(current_path).to eql weight_reports_path
      expect(page).to have_content Date.today
    end

    scenario 'fail to create report with invalid weight' do
      fill_in 'weight_report_date', with: Date.today
      fill_in 'weight_report_weight_pounds', with: -180
      click_button 'Submit'

      expect(page).to have_content 'New Weight Report'
      expect(page).to have_content 'Validation failed: Weight pounds must be greater than 0.0'
    end
  end

  describe 'update weight report' do
    let(:weight_report) { create :weight_report }

    before { visit weight_reports_path + "/#{weight_report.id}/edit" }

    scenario 'view weight report\'s edit page' do
      expect(page).to have_content 'Editing Weight Report'
    end

    scenario 'update valid weight report' do
      fill_in 'weight_report_date', with: Date.today - 1.day
      fill_in 'weight_report_weight_pounds', with: 175
      click_button 'Submit'

      expect(current_path).to eql weight_reports_path
      expect(page).to have_content Date.today - 1.day
      expect(page).not_to have_content Date.today
    end
  end
end
