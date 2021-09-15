require 'test_helper'

class ItmesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get itmes_index_url
    assert_response :success
  end

  test "should get show" do
    get itmes_show_url
    assert_response :success
  end

end
