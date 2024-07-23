require "test_helper"

class TodoWithBlobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_with_blob = todo_with_blobs(:one)
  end

  test "should get index" do
    get todo_with_blobs_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_with_blob_url
    assert_response :success
  end

  test "should create todo_with_blob" do
    assert_difference("TodoWithBlob.count") do
      post todo_with_blobs_url, params: { todo_with_blob: { body: @todo_with_blob.body, finished: @todo_with_blob.finished } }
    end

    assert_redirected_to todo_with_blob_url(TodoWithBlob.last)
  end

  test "should show todo_with_blob" do
    get todo_with_blob_url(@todo_with_blob)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_with_blob_url(@todo_with_blob)
    assert_response :success
  end

  test "should update todo_with_blob" do
    patch todo_with_blob_url(@todo_with_blob), params: { todo_with_blob: { body: @todo_with_blob.body, finished: @todo_with_blob.finished } }
    assert_redirected_to todo_with_blob_url(@todo_with_blob)
  end

  test "should destroy todo_with_blob" do
    assert_difference("TodoWithBlob.count", -1) do
      delete todo_with_blob_url(@todo_with_blob)
    end

    assert_redirected_to todo_with_blobs_url
  end
end
