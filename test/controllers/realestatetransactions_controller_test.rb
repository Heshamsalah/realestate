require 'test_helper'

class RealestatetransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get realestatetransactions_index_url
    assert_response :success
  end

  test "should get show" do
    get realestatetransactions_show_url
    assert_response :success
  end

  test "should get edit" do
    get realestatetransactions_edit_url
    assert_response :success
  end

  test "should get new" do
    get realestatetransactions_new_url
    assert_response :success
  end

  test "should get create" do
    get realestatetransactions_create_url
    assert_response :success
  end

  test "should get update" do
    get realestatetransactions_update_url
    assert_response :success
  end

  test "should get delete" do
    get realestatetransactions_delete_url
    assert_response :success
  end

end
