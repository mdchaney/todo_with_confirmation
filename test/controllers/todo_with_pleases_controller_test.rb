require "test_helper"

class TodosWithPleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todos_with_please = todos_with_pleases(:one)
  end

  test "should get index" do
    get todos_with_pleases_url
    assert_response :success
  end

  test "should get new" do
    get new_todos_with_please_url
    assert_response :success
  end

  test "should create todos_with_please" do
    assert_difference("TodosWithPlease.count") do
      post todos_with_pleases_url, params: { todos_with_please: { body: @todos_with_please.body, finished: @todos_with_please.finished } }
    end

    assert_redirected_to todos_with_please_url(TodosWithPlease.last)
  end

  test "should show todos_with_please" do
    get todos_with_please_url(@todos_with_please)
    assert_response :success
  end

  test "should get edit" do
    get edit_todos_with_please_url(@todos_with_please)
    assert_response :success
  end

  test "should update todos_with_please" do
    patch todos_with_please_url(@todos_with_please), params: { todos_with_please: { body: @todos_with_please.body, finished: @todos_with_please.finished } }
    assert_redirected_to todos_with_please_url(@todos_with_please)
  end

  test "should destroy todos_with_please" do
    assert_difference("TodosWithPlease.count", -1) do
      delete todos_with_please_url(@todos_with_please)
    end

    assert_redirected_to todos_with_pleases_url
  end
end
