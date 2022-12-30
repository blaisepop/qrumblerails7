require "test_helper"

class DynamicRedirectionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dynamic_redirection_new_url
    assert_response :success
  end

  test "should get create" do
    get dynamic_redirection_create_url
    assert_response :success
  end

  test "should get destroy" do
    get dynamic_redirection_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get dynamic_redirection_edit_url
    assert_response :success
  end

  test "should get index" do
    get dynamic_redirection_index_url
    assert_response :success
  end

  test "should get update" do
    get dynamic_redirection_update_url
    assert_response :success
  end
end
