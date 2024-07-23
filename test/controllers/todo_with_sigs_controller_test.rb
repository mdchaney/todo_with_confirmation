require "test_helper"

class TodoWithSigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_with_sig = todo_with_sigs(:one)
  end

  test "should get index" do
    get todo_with_sigs_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_with_sig_url
    assert_response :success
  end

  test "should create todo_with_sig" do
    assert_difference("TodoWithSig.count") do
      post todo_with_sigs_url, params: { todo_with_sig: { body: @todo_with_sig.body, finished: @todo_with_sig.finished } }
    end

    assert_redirected_to todo_with_sig_url(TodoWithSig.last)
  end

  test "should show todo_with_sig" do
    get todo_with_sig_url(@todo_with_sig)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_with_sig_url(@todo_with_sig)
    assert_response :success
  end

  test "should update todo_with_sig" do
    patch todo_with_sig_url(@todo_with_sig), params: { todo_with_sig: { body: @todo_with_sig.body, finished: @todo_with_sig.finished } }
    assert_redirected_to todo_with_sig_url(@todo_with_sig)
  end

  test "should destroy todo_with_sig" do
    assert_difference("TodoWithSig.count", -1) do
      delete todo_with_sig_url(@todo_with_sig)
    end

    assert_redirected_to todo_with_sigs_url
  end
end
