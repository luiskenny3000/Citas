require 'test_helper'

class ResoucesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resouce = resouces(:one)
  end

  test "should get index" do
    get resouces_url
    assert_response :success
  end

  test "should get new" do
    get new_resouce_url
    assert_response :success
  end

  test "should create resouce" do
    assert_difference('Resouce.count') do
      post resouces_url, params: { resouce: { name: @resouce.name } }
    end

    assert_redirected_to resouce_url(Resouce.last)
  end

  test "should show resouce" do
    get resouce_url(@resouce)
    assert_response :success
  end

  test "should get edit" do
    get edit_resouce_url(@resouce)
    assert_response :success
  end

  test "should update resouce" do
    patch resouce_url(@resouce), params: { resouce: { name: @resouce.name } }
    assert_redirected_to resouce_url(@resouce)
  end

  test "should destroy resouce" do
    assert_difference('Resouce.count', -1) do
      delete resouce_url(@resouce)
    end

    assert_redirected_to resouces_url
  end
end
