require "application_system_test_case"

class CardioReportsTest < ApplicationSystemTestCase
  setup do
    @cardio_report = cardio_reports(:one)
  end

  test "visiting the index" do
    visit cardio_reports_url
    assert_selector "h1", text: "Cardio Reports"
  end

  test "creating a Cardio report" do
    visit cardio_reports_url
    click_on "New Cardio Report"

    fill_in "Cardio type", with: @cardio_report.cardio_type
    check "Machine" if @cardio_report.machine
    fill_in "Miles", with: @cardio_report.miles
    fill_in "Seconds", with: @cardio_report.seconds
    fill_in "Timestamp", with: @cardio_report.timestamp
    click_on "Create Cardio report"

    assert_text "Cardio report was successfully created"
    click_on "Back"
  end

  test "updating a Cardio report" do
    visit cardio_reports_url
    click_on "Edit", match: :first

    fill_in "Cardio type", with: @cardio_report.cardio_type
    check "Machine" if @cardio_report.machine
    fill_in "Miles", with: @cardio_report.miles
    fill_in "Seconds", with: @cardio_report.seconds
    fill_in "Timestamp", with: @cardio_report.timestamp
    click_on "Update Cardio report"

    assert_text "Cardio report was successfully updated"
    click_on "Back"
  end

  test "destroying a Cardio report" do
    visit cardio_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cardio report was successfully destroyed"
  end
end
