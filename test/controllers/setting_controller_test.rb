require 'test_helper'

class SettingControllerTest < ActionController::TestCase
  test "should get mailDetails" do
    get :mailDetails
    assert_response :success
  end

end
