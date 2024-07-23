require "application_system_test_case"

class TodosWithPleasesTest < ApplicationSystemTestCase
  setup do
    @todos_with_please = todos_with_pleases(:one)
  end

  test "visiting the index" do
    visit todos_with_pleases_url
    assert_selector "h1", text: "Todos with pleases"
  end

  test "should create todos with please" do
    visit todos_with_pleases_url
    click_on "New todos with please"

    fill_in "Body", with: @todos_with_please.body
    check "Finished" if @todos_with_please.finished
    click_on "Create Todos with please"

    assert_text "Todos with please was successfully created"
    click_on "Back"
  end

  test "should update Todos with please" do
    visit todos_with_please_url(@todos_with_please)
    click_on "Edit this todos with please", match: :first

    fill_in "Body", with: @todos_with_please.body
    check "Finished" if @todos_with_please.finished
    click_on "Update Todos with please"

    assert_text "Todos with please was successfully updated"
    click_on "Back"
  end

  test "should destroy Todos with please" do
    visit todos_with_please_url(@todos_with_please)
    click_on "Destroy this todos with please", match: :first

    assert_text "Todos with please was successfully destroyed"
  end
end
