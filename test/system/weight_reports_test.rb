# frozen_string_literal: true

require 'application_system_test_case'

class WeightReportsTest < ApplicationSystemTestCase
  setup do
    @weight_report = weight_reports(:one)
  end

  test 'visiting the index' do
    visit weight_reports_path
    assert_selector 'h1', text: 'Weight Reports'
  end

  test 'creating a Weight report' do
    visit weight_reports_path
    click_on 'New Weight Report'

    fill_in 'Pounds', with: @weight_report.weight_pounds
    fill_in 'Date', with: @weight_report.date
    click_on 'Create Weight report'

    assert_text 'Weight report was successfully created'
    click_on 'Back'
  end

  test 'updating a Weight report' do
    visit weight_reports_path
    click_on 'Edit', match: :first

    fill_in 'Pounds', with: @weight_report.weight_pounds
    fill_in 'Date', with: @weight_report.date
    click_on 'Update Weight report'

    assert_text 'Weight report was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Weight report' do
    visit weight_reports_path
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Weight report was successfully destroyed'
  end
end
