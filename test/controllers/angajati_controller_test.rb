require "test_helper"

class AngajatiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get angajati_index_url
    assert_response :success
  end

  test "should get show" do
    get angajati_show_url
    assert_response :success
  end

  test "should get new" do
    get angajati_new_url
    assert_response :success
  end

  test "should get create" do
    get angajati_create_url
    assert_response :success
  end

  test "should get edit" do
    get angajati_edit_url
    assert_response :success
  end

  test "should get update" do
    get angajati_update_url
    assert_response :success
  end

  test "should get destroy" do
    get angajati_destroy_url
    assert_response :success
  end
end
