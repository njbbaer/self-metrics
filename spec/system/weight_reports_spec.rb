# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Weight Reports', type: :system do
  include Authentication

  let!(:weight_report) { create :weight_report }
  let(:free_date) { weight_report.date - 1.day }

  before { log_in }

  describe 'list reports' do
    before { visit weight_reports_path }

    scenario 'view index page' do
      expect(page).to have_content 'Weight Reports'
    end

    scenario 'delete report', js: true do
      accept_alert do
        find('.octicon-trashcan').click
      end
      expect(page).to have_content 'Weight report deleted'
    end
  end

  describe 'create report' do
    before { visit new_weight_report_path }

    scenario 'view new report page' do
      expect(page).to have_content 'New Weight Report'
    end

    scenario 'create valid report' do
      fill_in 'weight_report_date', with: free_date
      fill_in 'weight_report_weight_pounds', with: 180
      click_button 'Submit'

      expect(current_path).to eql weight_reports_path
      expect(page).to have_content free_date
    end

    scenario 'fail to create invalid report' do
      fill_in 'weight_report_date', with: free_date
      fill_in 'weight_report_weight_pounds', with: -180
      click_button 'Submit'

      expect(page).to have_content 'New Weight Report'
      expect(page).to have_content 'Validation failed: Weight pounds must be greater than 0.0'
    end
  end

  describe 'update report' do
    before { visit weight_reports_path + "/#{weight_report.id}/edit" }

    scenario 'view edit report page' do
      expect(page).to have_content 'Editing Weight Report'
    end

    scenario 'update valid report' do
      fill_in 'weight_report_date', with: free_date
      fill_in 'weight_report_weight_pounds', with: 175
      click_button 'Submit'

      expect(current_path).to eql weight_reports_path
      expect(page).to have_content free_date
      expect(page).not_to have_content Date.today
    end
  end
end
