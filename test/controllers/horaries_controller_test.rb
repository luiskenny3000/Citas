require 'test_helper'

class HorariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @horary = horaries(:one)
  end

  test "should get index" do
    get horaries_url
    assert_response :success
  end

  test "should get new" do
    get new_horary_url
    assert_response :success
  end

  test "should create horary" do
    assert_difference('Horary.count') do
      post horaries_url, params: { horary: { date: @horary.date, duration: @horary.duration, hour: @horary.hour, reservation_id: @horary.reservation_id } }
    end

    assert_redirected_to horary_url(Horary.last)
  end

  test "should show horary" do
    get horary_url(@horary)
    assert_response :success
  end

  test "should get edit" do
    get edit_horary_url(@horary)
    assert_response :success
  end

  test "should update horary" do
    patch horary_url(@horary), params: { horary: { date: @horary.date, duration: @horary.duration, hour: @horary.hour, reservation_id: @horary.reservation_id } }
    assert_redirected_to horary_url(@horary)
  end

  test "should destroy horary" do
    assert_difference('Horary.count', -1) do
      delete horary_url(@horary)
    end

    assert_redirected_to horaries_url
  end
end
