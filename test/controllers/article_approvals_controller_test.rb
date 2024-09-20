require "test_helper"

class ArticleApprovalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get article_approvals_index_url
    assert_response :success
  end

  test "should get show" do
    get article_approvals_show_url
    assert_response :success
  end

  test "should get create" do
    get article_approvals_create_url
    assert_response :success
  end

  test "should get update" do
    get article_approvals_update_url
    assert_response :success
  end

  test "should get destroy" do
    get article_approvals_destroy_url
    assert_response :success
  end
end
