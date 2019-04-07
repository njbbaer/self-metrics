# frozen_string_literal: true

require 'application_system_test_case'

class SleepReportsTest < ApplicationSystemTestCase
  setup do
    @sleep_report = sleep_reports(:one)
  end

  test 'visiting the index' do
    visit sleep_reports_url
    assert_selector 'h1', text: 'Sleep Reports'
  end

  test 'creating a Sleep report' do
    visit sleep_reports_url
    click_on 'New Sleep Report'

    fill_in 'Asleep at', with: @sleep_report.asleep_at
    fill_in 'Wakeup at', with: @sleep_report.wakeup_at
    click_on 'Create Sleep report'

    assert_text 'Sleep report was successfully created'
    click_on 'Back'
  end

  test 'updating a Sleep report' do
    visit sleep_reports_url
    click_on 'Edit', match: :first

    fill_in 'Asleep at', with: @sleep_report.asleep_at
    fill_in 'Wakeup at', with: @sleep_report.wakeup_at
    click_on 'Update Sleep report'

    assert_text 'Sleep report was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Sleep report' do
    visit sleep_reports_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Sleep report was successfully destroyed'
  end
end
