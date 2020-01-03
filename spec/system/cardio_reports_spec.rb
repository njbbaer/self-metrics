# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cardio Reports', type: :system do
  include Authentication

  let!(:cardio_report) { create :cardio_report }
  let!(:new_cardio_report) { build :cardio_report }

  before { log_in }

  describe 'list reports' do
    before { visit cardio_reports_path }

    scenario 'view index page' do
      expect(page).to have_content 'Cardio Reports'
    end

    scenario 'delete report', js: true do
      accept_alert do
        find('.octicon-trashcan').click
      end
      expect(page).to have_content 'Cardio report deleted'
    end
  end

  describe 'create report' do
    before { visit new_cardio_report_path }

    scenario 'view new report page' do
      expect(page).to have_content 'New Cardio Report'
    end

    scenario 'create valid report' do
      fill_in 'cardio_report_date', with: new_cardio_report.date
      fill_in 'cardio_report_distance_miles', with: new_cardio_report.distance_miles
      fill_in 'cardio_report_part_minutes', with: new_cardio_report.duration_time.min
      fill_in 'cardio_report_part_seconds', with: new_cardio_report.duration_time.sec
      choose 'Treadmill'
      click_button 'Submit'

      expect(current_path).to eql cardio_reports_path
      expect(page).to have_content new_cardio_report.date.strftime('%a, %b %d, %Y')
    end

    scenario 'fail to create invalid report' do
      click_button 'Submit'

      expect(page).to have_content 'New Cardio Report'
      expect(page).to have_content 'Validation failed'
    end
  end

  describe 'update report' do
    before { visit cardio_reports_path + "/#{cardio_report.id}/edit" }

    scenario 'view edit report page' do
      expect(page).to have_content 'Editing Cardio Report'
    end

    scenario 'update valid report' do
      fill_in 'cardio_report_date', with: new_cardio_report.date
      click_button 'Submit'

      expect(current_path).to eql cardio_reports_path
      expect(page).to have_content new_cardio_report.date.strftime('%a, %b %d, %Y')
      expect(page).not_to have_content cardio_report.date.strftime('%a, %b %d, %Y')
    end
  end
end