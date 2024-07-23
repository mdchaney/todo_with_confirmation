require "application_system_test_case"

class TodoWithBlobsTest < ApplicationSystemTestCase
  setup do
    @todo_with_blob = todo_with_blobs(:one)
  end

  test "visiting the index" do
    visit todo_with_blobs_url
    assert_selector "h1", text: "Todo with blobs"
  end

  test "should create todo with blob" do
    visit todo_with_blobs_url
    click_on "New todo with blob"

    fill_in "Body", with: @todo_with_blob.body
    check "Finished" if @todo_with_blob.finished
    click_on "Create Todo with blob"

    assert_text "Todo with blob was successfully created"
    click_on "Back"
  end

  test "should update Todo with blob" do
    visit todo_with_blob_url(@todo_with_blob)
    click_on "Edit this todo with blob", match: :first

    fill_in "Body", with: @todo_with_blob.body
    check "Finished" if @todo_with_blob.finished
    click_on "Update Todo with blob"

    assert_text "Todo with blob was successfully updated"
    click_on "Back"
  end

  test "should destroy Todo with blob" do
    visit todo_with_blob_url(@todo_with_blob)
    click_on "Destroy this todo with blob", match: :first

    assert_text "Todo with blob was successfully destroyed"
  end
end
