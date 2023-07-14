require "test_helper"

class FeebacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feeback = feebacks(:one)
  end

  test "should get index" do
    get feebacks_url
    assert_response :success
  end

  test "should get new" do
    get new_feeback_url
    assert_response :success
  end

  test "should create feeback" do
    assert_difference("Feeback.count") do
      post feebacks_url, params: { feeback: {  } }
    end

    assert_redirected_to feeback_url(Feeback.last)
  end

  test "should show feeback" do
    get feeback_url(@feeback)
    assert_response :success
  end

  test "should get edit" do
    get edit_feeback_url(@feeback)
    assert_response :success
  end

  test "should update feeback" do
    patch feeback_url(@feeback), params: { feeback: {  } }
    assert_redirected_to feeback_url(@feeback)
  end

  test "should destroy feeback" do
    assert_difference("Feeback.count", -1) do
      delete feeback_url(@feeback)
    end

    assert_redirected_to feebacks_url
  end
end
