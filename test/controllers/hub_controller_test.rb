require 'test_helper'

class HubControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hub_index_url
    assert_response :success
  end

  test "should get message" do
    get hub_message_url
    assert_response :success
  end

  test "should get admin" do
    get hub_admin_url
    assert_response :success
  end

end
