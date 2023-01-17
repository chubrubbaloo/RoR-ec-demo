require "test_helper"

class ClassmatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classmate = classmates(:one)
  end

  test "should get index" do
    get classmates_url
    assert_response :success
  end

  test "should get new" do
    get new_classmate_url
    assert_response :success
  end

  test "should create classmate" do
    assert_difference("Classmate.count") do
      post classmates_url, params: { classmate: { email: @classmate.email, first_name: @classmate.first_name, last_name: @classmate.last_name, phone: @classmate.phone } }
    end

    assert_redirected_to classmate_url(Classmate.last)
  end

  test "should show classmate" do
    get classmate_url(@classmate)
    assert_response :success
  end

  test "should get edit" do
    get edit_classmate_url(@classmate)
    assert_response :success
  end

  test "should update classmate" do
    patch classmate_url(@classmate), params: { classmate: { email: @classmate.email, first_name: @classmate.first_name, last_name: @classmate.last_name, phone: @classmate.phone } }
    assert_redirected_to classmate_url(@classmate)
  end

  test "should destroy classmate" do
    assert_difference("Classmate.count", -1) do
      delete classmate_url(@classmate)
    end

    assert_redirected_to classmates_url
  end
end
