require 'test_helper'

class SettingsmtpsControllerTest < ActionController::TestCase
  setup do
    @settingsmtp = settingsmtps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settingsmtps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create settingsmtp" do
    assert_difference('Settingsmtp.count') do
      post :create, settingsmtp: { enable_ssl: @settingsmtp.enable_ssl, hostaddress: @settingsmtp.hostaddress, password: @settingsmtp.password, post: @settingsmtp.post, protocol: @settingsmtp.protocol, user_id: @settingsmtp.user_id, user_name: @settingsmtp.user_name }
    end

    assert_redirected_to settingsmtp_path(assigns(:settingsmtp))
  end

  test "should show settingsmtp" do
    get :show, id: @settingsmtp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @settingsmtp
    assert_response :success
  end

  test "should update settingsmtp" do
    patch :update, id: @settingsmtp, settingsmtp: { enable_ssl: @settingsmtp.enable_ssl, hostaddress: @settingsmtp.hostaddress, password: @settingsmtp.password, post: @settingsmtp.post, protocol: @settingsmtp.protocol, user_id: @settingsmtp.user_id, user_name: @settingsmtp.user_name }
    assert_redirected_to settingsmtp_path(assigns(:settingsmtp))
  end

  test "should destroy settingsmtp" do
    assert_difference('Settingsmtp.count', -1) do
      delete :destroy, id: @settingsmtp
    end

    assert_redirected_to settingsmtps_path
  end
end
