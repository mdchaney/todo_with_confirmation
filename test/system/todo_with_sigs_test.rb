require "application_system_test_case"

class TodoWithSigsTest < ApplicationSystemTestCase
  setup do
    @todo_with_sig = todo_with_sigs(:one)
  end

  test "visiting the index" do
    visit todo_with_sigs_url
    assert_selector "h1", text: "Todo with sigs"
  end

  test "should create todo with sig" do
    visit todo_with_sigs_url
    click_on "New todo with sig"

    fill_in "Body", with: @todo_with_sig.body
    check "Finished" if @todo_with_sig.finished
    click_on "Create Todo with sig"

    assert_text "Todo with sig was successfully created"
    click_on "Back"
  end

  test "should update Todo with sig" do
    visit todo_with_sig_url(@todo_with_sig)
    click_on "Edit this todo with sig", match: :first

    fill_in "Body", with: @todo_with_sig.body
    check "Finished" if @todo_with_sig.finished
    click_on "Update Todo with sig"

    assert_text "Todo with sig was successfully updated"
    click_on "Back"
  end

  test "should destroy Todo with sig" do
    visit todo_with_sig_url(@todo_with_sig)
    click_on "Destroy this todo with sig", match: :first

    assert_text "Todo with sig was successfully destroyed"
  end
end
