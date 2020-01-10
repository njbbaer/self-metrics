# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sleep Reports', type: :system do
  include Authentication

  let!(:sleep_report) { create :sleep_report }
  let!(:incomplete_sleep_report) { create :sleep_report, wakeup_at: nil }
  let!(:new_sleep_report) { build :sleep_report }

  before { log_in }

  describe 'list reports' do
    before { visit sleep_reports_path }

    context 'empty list' do
      scenario 'view index page' do
        expect(page).to have_content 'Sleep Reports'
      end
    end

    scenario 'delete report', js: true do
      accept_alert do
        find('.octicon-trashcan', match: :first).click
      end
      expect(page).to have_content 'Sleep report deleted'
    end
  end

  describe 'create report' do
    before { visit new_sleep_report_path }

    scenario 'view new report page' do
      expect(page).to have_content 'New Sleep Report'
    end

    scenario 'create valid complete report' do
      fill_in 'sleep_report_asleep_at', with: new_sleep_report.asleep_at
      fill_in 'sleep_report_wakeup_at', with: new_sleep_report.wakeup_at
      click_button 'Submit'

      expect(current_path).to eql sleep_reports_path
      expect(page).to have_content new_sleep_report.date.strftime('%a, %b %d, %Y')
    end

    scenario 'create valid partial report' do
      fill_in 'sleep_report_asleep_at', with: new_sleep_report.asleep_at
      click_button 'Submit'

      expect(current_path).to eql sleep_reports_path
      expect(page).to have_content new_sleep_report.date.strftime('%a, %b %d, %Y')
    end

    scenario 'fail to create invalid report' do
      click_button 'Submit'

      expect(page).to have_content 'New Sleep Report'
      expect(page).to have_content 'Validation failed'
    end
  end

  describe 'update report' do
    before { visit sleep_reports_path + "/#{incomplete_sleep_report.id}/edit" }

    scenario 'view edit report page' do
      expect(page).to have_content 'Editing Sleep Report'
    end

    scenario 'complete partial report' do
      wakeup_at = (incomplete_sleep_report.asleep_at + 7.hours).strftime('%a, %b %d, %Y')
      fill_in 'sleep_report_wakeup_at', with: wakeup_at
      click_button 'Submit'

      expect(page).to have_content 'Sleep report updated'
      expect(current_path).to eql sleep_reports_path
    end
  end
end
