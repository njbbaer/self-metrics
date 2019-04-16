require 'test_helper'

class SummaryControllerTest < ActionDispatch::IntegrationTest
  setup do
    authenticate
  end

  test "should get index" do
    get summary_index_path
    assert_response :success
  end
end
