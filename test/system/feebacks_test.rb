require "application_system_test_case"

class FeebacksTest < ApplicationSystemTestCase
  setup do
    @feeback = feebacks(:one)
  end

  test "visiting the index" do
    visit feebacks_url
    assert_selector "h1", text: "Feebacks"
  end

  test "should create feeback" do
    visit feebacks_url
    click_on "New feeback"

    click_on "Create Feeback"

    assert_text "Feeback was successfully created"
    click_on "Back"
  end

  test "should update Feeback" do
    visit feeback_url(@feeback)
    click_on "Edit this feeback", match: :first

    click_on "Update Feeback"

    assert_text "Feeback was successfully updated"
    click_on "Back"
  end

  test "should destroy Feeback" do
    visit feeback_url(@feeback)
    click_on "Destroy this feeback", match: :first

    assert_text "Feeback was successfully destroyed"
  end
end
