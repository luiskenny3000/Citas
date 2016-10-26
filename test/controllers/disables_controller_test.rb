require 'test_helper'

class DisablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disable = disables(:one)
  end

  test "should get index" do
    get disables_url
    assert_response :success
  end

  test "should get new" do
    get new_disable_url
    assert_response :success
  end

  test "should create disable" do
    assert_difference('Disable.count') do
      post disables_url, params: { disable: { begin: @disable.begin, end: @disable.end, room_id: @disable.room_id } }
    end

    assert_redirected_to disable_url(Disable.last)
  end

  test "should show disable" do
    get disable_url(@disable)
    assert_response :success
  end

  test "should get edit" do
    get edit_disable_url(@disable)
    assert_response :success
  end

  test "should update disable" do
    patch disable_url(@disable), params: { disable: { begin: @disable.begin, end: @disable.end, room_id: @disable.room_id } }
    assert_redirected_to disable_url(@disable)
  end

  test "should destroy disable" do
    assert_difference('Disable.count', -1) do
      delete disable_url(@disable)
    end

    assert_redirected_to disables_url
  end
end
