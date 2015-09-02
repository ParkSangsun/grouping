require 'test_helper'

class GrouplineControllerTest < ActionController::TestCase
  test "should get group_create" do
    get :group_create
    assert_response :success
  end

  test "should get group_list" do
    get :group_list
    assert_response :success
  end

  test "should get group_detail" do
    get :group_detail
    assert_response :success
  end

end
