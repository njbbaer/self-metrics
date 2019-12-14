# frozen_string_literal: true

require 'application_system_test_case'

class CardioReportsTest < ApplicationSystemTestCase
  setup do
    @cardio_report = cardio_reports(:one)
  end

  test 'visiting the index' do
    visit cardio_reports_path
    assert_selector 'h1', text: 'Cardio Reports'
  end

  test 'creating a Cardio report' do
    visit cardio_reports_path
    click_on 'New Cardio Report'

    check 'Treadmill' if @cardio_report.treadmill
    fill_in 'Miles', with: @cardio_report.distance_miles
    fill_in 'Duration', with: @cardio_report.duration_seconds
    fill_in 'Finished at', with: @cardio_report.date
    click_on 'Create Cardio report'

    assert_text 'Cardio report was successfully created'
    click_on 'Back'
  end

  test 'updating a Cardio report' do
    visit cardio_reports_path
    click_on 'Edit', match: :first

    check 'Treadmill' if @cardio_report.treadmill
    fill_in 'Miles', with: @cardio_report.distance_miles
    fill_in 'Duration', with: @cardio_report.duration_seconds
    fill_in 'Finished at', with: @cardio_report.date
    click_on 'Update Cardio report'

    assert_text 'Cardio report was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Cardio report' do
    visit cardio_reports_path
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Cardio report was successfully destroyed'
  end
end
