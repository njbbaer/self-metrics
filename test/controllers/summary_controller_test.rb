require 'test_helper'

class SummaryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get summary_index_path
    assert_response :success
  end
end
