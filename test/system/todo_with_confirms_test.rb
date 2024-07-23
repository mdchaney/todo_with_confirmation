require "application_system_test_case"

class TodoWithConfirmsTest < ApplicationSystemTestCase
  setup do
    @todo_with_confirm = todo_with_confirms(:one)
  end

  test "visiting the index" do
    visit todo_with_confirms_url
    assert_selector "h1", text: "Todo with confirms"
  end

  test "should create todo with confirm" do
    visit todo_with_confirms_url
    click_on "New todo with confirm"

    fill_in "Body", with: @todo_with_confirm.body
    check "Finished" if @todo_with_confirm.finished
    click_on "Create Todo with confirm"

    assert_text "Todo with confirm was successfully created"
    click_on "Back"
  end

  test "should update Todo with confirm" do
    visit todo_with_confirm_url(@todo_with_confirm)
    click_on "Edit this todo with confirm", match: :first

    fill_in "Body", with: @todo_with_confirm.body
    check "Finished" if @todo_with_confirm.finished
    click_on "Update Todo with confirm"

    assert_text "Todo with confirm was successfully updated"
    click_on "Back"
  end

  test "should destroy Todo with confirm" do
    visit todo_with_confirm_url(@todo_with_confirm)
    click_on "Destroy this todo with confirm", match: :first

    assert_text "Todo with confirm was successfully destroyed"
  end
end
