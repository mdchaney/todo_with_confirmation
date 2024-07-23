require "test_helper"

class TodoWithConfirmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_with_confirm = todo_with_confirms(:one)
  end

  test "should get index" do
    get todo_with_confirms_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_with_confirm_url
    assert_response :success
  end

  test "should create todo_with_confirm" do
    assert_difference("TodoWithConfirm.count") do
      post todo_with_confirms_url, params: { todo_with_confirm: { body: @todo_with_confirm.body, finished: @todo_with_confirm.finished } }
    end

    assert_redirected_to todo_with_confirm_url(TodoWithConfirm.last)
  end

  test "should show todo_with_confirm" do
    get todo_with_confirm_url(@todo_with_confirm)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_with_confirm_url(@todo_with_confirm)
    assert_response :success
  end

  test "should update todo_with_confirm" do
    patch todo_with_confirm_url(@todo_with_confirm), params: { todo_with_confirm: { body: @todo_with_confirm.body, finished: @todo_with_confirm.finished } }
    assert_redirected_to todo_with_confirm_url(@todo_with_confirm)
  end

  test "should destroy todo_with_confirm" do
    assert_difference("TodoWithConfirm.count", -1) do
      delete todo_with_confirm_url(@todo_with_confirm)
    end

    assert_redirected_to todo_with_confirms_url
  end
end
