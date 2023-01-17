require "application_system_test_case"

class ClassmatesTest < ApplicationSystemTestCase
  setup do
    @classmate = classmates(:one)
  end

  test "visiting the index" do
    visit classmates_url
    assert_selector "h1", text: "Classmates"
  end

  test "should create classmate" do
    visit classmates_url
    click_on "New classmate"

    fill_in "Email", with: @classmate.email
    fill_in "First name", with: @classmate.first_name
    fill_in "Last name", with: @classmate.last_name
    fill_in "Phone", with: @classmate.phone
    click_on "Create Classmate"

    assert_text "Classmate was successfully created"
    click_on "Back"
  end

  test "should update Classmate" do
    visit classmate_url(@classmate)
    click_on "Edit this classmate", match: :first

    fill_in "Email", with: @classmate.email
    fill_in "First name", with: @classmate.first_name
    fill_in "Last name", with: @classmate.last_name
    fill_in "Phone", with: @classmate.phone
    click_on "Update Classmate"

    assert_text "Classmate was successfully updated"
    click_on "Back"
  end

  test "should destroy Classmate" do
    visit classmate_url(@classmate)
    click_on "Destroy this classmate", match: :first

    assert_text "Classmate was successfully destroyed"
  end
end
