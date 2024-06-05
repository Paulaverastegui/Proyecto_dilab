require "test_helper"

class GussScalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guss_scales_index_url
    assert_response :success
  end

  test "should get show" do
    get guss_scales_show_url
    assert_response :success
  end

  test "should get new" do
    get guss_scales_new_url
    assert_response :success
  end

  test "should get edit" do
    get guss_scales_edit_url
    assert_response :success
  end

  test "should get create" do
    get guss_scales_create_url
    assert_response :success
  end

  test "should get update" do
    get guss_scales_update_url
    assert_response :success
  end

  test "should get destroy" do
    get guss_scales_destroy_url
    assert_response :success
  end
end
